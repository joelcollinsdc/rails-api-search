require 'test_helper'

class SearchTermTest < ActiveSupport::TestCase
  test "models have history" do
    assert_equal 2, search_terms(:one).histories.count
  end

  test "term uniqueness validation" do
    s = SearchTerm.new(term: "MyString")
    assert_not s.valid?
  end

  test "term length validation" do
    s = SearchTerm.new(term: "My")
    assert_not s.valid?

    s = SearchTerm.new(term: "MyS")
    assert s.valid?
  end

  test "counter cache works" do
    s = search_terms(:one)
    curr = s.count
    s.histories.create(date: "2017-07-08 13:03:23")
    assert_equal curr + 1, s.count
  end

  test "performing a search" do
    s = search_terms(:one)
    curr_count = s.count
    curr_updated = s.updated_at
    s.perform
    assert_equal curr_count + 1, s.count
    assert_not_equal curr_updated, s.updated_at
  end
end
