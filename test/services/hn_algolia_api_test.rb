require 'test_helper'

class HNAlgoliaAPITest < ActiveSupport::TestCase
  setup do
    @api = HNAlgoliaAPI.new
  end

  test "api returns results" do
    VCR.use_cassette("basic_test") do
      results = @api.search("test")
      assert results.success?
      assert_equal results['nbHits'], 289126
    end
  end
end