class SearchController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @searches = SearchTerm.order(sort_column + " " + sort_direction)
  end

  def search
    @term = params[:q] #further sanitization necessary?

    search_term = SearchTerm.find_by_term(@term)
    if search_term
      @term_history = search_term.histories
    end
    
    response = (APISearcher.new).search(@term)
    @hits = response['hits']
  end

  private
  def sort_column
    %w[term count updated_at].include?(params[:sort]) ? params[:sort] : "term"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
