require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/'
    assert_response :success
  end

  test "should do search" do
    VCR.use_cassette("basic_test") do
      get '/search?q=test'
      assert_response :success
    end
  end

  test "should not do search" do
    get '/search?q=te'
    assert_response :redirect
    assert_equal 'Please enter at least 3 characters...', flash[:error]
  end
end