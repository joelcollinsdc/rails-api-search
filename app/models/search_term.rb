class SearchTerm < ApplicationRecord
  #fields: term, count
  validates :term, length: { minimum: 3 }, uniqueness: true
  
  has_many :histories, class_name: "SearchTermHistory"
end
