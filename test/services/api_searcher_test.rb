require 'test_helper'

class APISearcherTest < ActiveSupport::TestCase
  setup do
    @searcher = APISearcher.new
  end

  test "searcher creates term" do
    VCR.use_cassette("basic_test") do
      assert_nil SearchTerm.find_by_term("test")
      results = @searcher.search("test")
      assert_not_nil SearchTerm.find_by_term("test")
      assert_equal 1, SearchTerm.find_by_term("test").count
    end
  end
end