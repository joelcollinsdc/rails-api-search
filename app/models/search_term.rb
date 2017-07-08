class SearchTerm < ApplicationRecord
  #fields: term, count
  validates :term, length: { minimum: 3 }, uniqueness: true
  
  has_many :histories, class_name: "SearchTermHistory"

  #perform a search, counter increments automatically with couter cache
  def perform
    self.histories << SearchTermHistory.create(date: DateTime.now)
  end
end
