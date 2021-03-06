class SearchTermHistory < ApplicationRecord
  belongs_to :search_term, dependent: :destroy, counter_cache: :count

  default_scope { order('created_at desc') }
end
