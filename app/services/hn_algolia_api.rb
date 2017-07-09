# light wrapper for algolia HN api
# TODO: paging
class HNAlgoliaAPI
  include HTTParty
  base_uri 'https://hn.algolia.com/api/v1/'

  def search(term, page=0)
    self.class.get('/search', query: { query: term, page: page })
  end
end
