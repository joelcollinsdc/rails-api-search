class SearchTerm < ApplicationRecord
  #fields: term, count
  validates :term, length: { minimum: 3 }, uniqueness: true
  
  has_many :histories, class_name: "SearchTermHistory"

  scope :recent, -> { order('updated_at desc') }
  
  #perform a search, counter increments automatically with couter cache
  def perform
    self.histories << SearchTermHistory.create
    self.touch #updated_at does not update automatically?
  end
end
