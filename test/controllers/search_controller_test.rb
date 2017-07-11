require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    assert_response :success
  end

  test 'should do search' do
    VCR.use_cassette("basic_test") do
      get '/search?q=test'
      assert_response :success
    end
  end

  test 'minimum character length' do
    get '/search?q=te'
    assert_response :redirect
    assert_equal 'Please enter at least 3 characters.', flash[:error]
  end

  test 'maximum character length' do
    get '/search?q=' + 'a' * 256
    assert_response :redirect
    assert_equal 'Search is too long, please try a shorter one.', flash[:error]
  end

  test 'paging' do
    get '/'
    assert_select "nav.pagination span.page", {count: 0}

    25.times do |t|
      SearchTerm.create(term: "term_#{t}")
    end
    
    get '/'
    assert_select "nav.pagination span.page", {count: 2}
  end
end