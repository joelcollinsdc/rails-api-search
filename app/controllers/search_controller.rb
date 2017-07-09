class SearchController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @searches = SearchTerm.order(sort_column + " " + sort_direction)
  end

  def search
    @term = params[:q] #further sanitization necessary?

    #more complicated validation would necessitate making a model for the form...
    if @term.length < 3
      return redirect_to({ action: "index"}, flash: { :error => "Please enter at least 3 characters..." })
    end

    search_term = SearchTerm.find_by_term(@term)
    if search_term
      @term_history = search_term.histories
    end
    
    begin
      response = (APISearcher.new).search(@term)
      @hits = response['hits']
    rescue StandardError => e
      return redirect_to({ action: "index"}, flash: { :error => "ERROR: #{e.message}" })
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
