class CreateSearchTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :search_terms do |t|
      t.string :term
      t.integer :count, default: 0

      t.timestamps
    end
    add_index :search_terms, :term, unique: true
  end
end
