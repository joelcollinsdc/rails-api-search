class APISearcher
  # perform an API search and save & save it
  def search(term)
    api = HNAlgoliaAPI.new
    request = api.search(term)
    if request.success?
      st = SearchTerm.find_or_create_by(term: term)
      st.perform
      return request.parsed_response
    else
      return nil #TODO
    end
  end
end