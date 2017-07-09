require 'test_helper'

class APISearcherTest < ActiveSupport::TestCase
  setup do
    @searcher = APISearcher.new
  end

  test "searcher creates term" do
    VCR.use_cassette("basic_test") do
      assert_nil SearchTerm.find_by_term("test")
      results = @searcher.search("test")
      term = SearchTerm.find_by_term("test")
      assert_not_nil term
      assert_equal 1, term.count
      assert_equal 1, term.histories.count
    end
  end
end