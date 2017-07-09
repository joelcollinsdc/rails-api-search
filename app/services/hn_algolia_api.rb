# light wrapper for algolia HN api
# TODO: paging
class HNAlgoliaAPI
  include HTTParty
  base_uri 'https://hn.algolia.com/api/v1/'

  def search(term)
    self.class.get('/search', query: { query: term })
  end
end
