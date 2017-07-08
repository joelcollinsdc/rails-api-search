class SearchController < ApplicationController
  #before_action :set_search_term, only: [:search]

  # GET /search_terms
  # GET /search_terms.json
  def index
    @recent_searches = SearchTerm.recent
  end

  # POST /search_terms
  # POST /search_terms.json
  def search
    @term = params[:q] #sanitize??

    #puts term
    @search_term = SearchTerm.find_by_term(@term)
    if @search_term
      @term_history = @search_term.histories
    end
    
    searcher = APISearcher.new
    response = searcher.search(@term)
    @hits = response['hits']
  end

  private
    def search_params
      params.permit(:q)
    end
end
