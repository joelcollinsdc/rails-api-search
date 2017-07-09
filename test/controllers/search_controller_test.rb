require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @search_term = search_terms(:one)
  # end

  test "should get index" do
    get '/'
    assert_response :success
  end

  test "should get search" do
    VCR.use_cassette("basic_test") do
      get '/search?q=test'
      assert_response :success
    end
  end

  # test "should perform search" do
  #   assert_difference('SearchTerm.count') do
  #     post search_terms_url, params: { search_term: {  } }
  #   end

  #   assert_redirected_to search_term_url(SearchTerm.last)
  # end

  # test "should show search_term" do
  #   get search_term_url(@search_term)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_search_term_url(@search_term)
  #   assert_response :success
  # end

  # test "should update search_term" do
  #   patch search_term_url(@search_term), params: { search_term: {  } }
  #   assert_redirected_to search_term_url(@search_term)
  # end

  # test "should destroy search_term" do
  #   assert_difference('SearchTerm.count', -1) do
  #     delete search_term_url(@search_term)
  #   end

  #   assert_redirected_to search_terms_url
  # end
end
