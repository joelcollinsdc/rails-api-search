class SearchController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @searches = SearchTerm.order(sort_column + " " + sort_direction)
  end

  def search
    @term = params[:q] # further sanitization necessary?
    @page = params[:page].to_i ||= 0

    # more complicated validation would necessitate making a model for the form
    if @term.length < 3
      return redirect_to({ action: 'index' }, flash: { :error => 'Please enter at least 3 characters.' })
    elsif @term.length > 255
      return redirect_to({ action: 'index' }, flash: { :error => 'Search is too long, please try a shorter one.' })
    end

    search_term = SearchTerm.find_by_term(@term)

    @term_history = search_term.histories if search_term

    begin
      @response = APISearcher.new.search(@term, @page)
      @next_page = @page + 1 if @response['nbPages'] > @page
      @prev_page = @page - 1 if @page > 0
    rescue SocketError, Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
       Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      return redirect_to({ action: 'index' }, flash: { :error => "ERROR: #{e.message}" })
    end

  end

  private
  def sort_column
    %w[term count updated_at].include?(params[:sort]) ? params[:sort] : "updated_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
