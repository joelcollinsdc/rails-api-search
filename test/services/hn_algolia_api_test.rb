require 'test_helper'

class HNAlgoliaAPITest < ActiveSupport::TestCase
  setup do
    @api = HNAlgoliaAPI.new
  end

  test "api returns results" do
    VCR.use_cassette("basic_test") do
      results = @api.search("test")
      assert results.success?
      assert_equal 0, results['page']
    end
  end

  test "api returns paged results" do
    VCR.use_cassette("basic_test_paged") do
      results = @api.search("test", 2)
      assert results.success?
      assert_equal 2, results['page']
    end
  end

  #TODO how to test connection errors?
end