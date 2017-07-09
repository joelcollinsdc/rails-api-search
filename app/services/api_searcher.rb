# API request and query saving logic
class APISearcher
  # perform an API search and save it
  def search(term)
    api = HNAlgoliaAPI.new
    request = api.search(term)

    raise 'An exception occurred querying the API' unless request.success?

    st = SearchTerm.find_or_create_by(term: term)
    st.perform
    request.parsed_response
  end
end
