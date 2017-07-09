class CreateSearchTermHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :search_term_histories do |t|
      t.references :search_term, foreign_key: true
      t.datetime :created_at, null: false
    end
  end
end