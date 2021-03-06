# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170708125322) do

  create_table "search_term_histories", force: :cascade do |t|
    t.integer "search_term_id"
    t.datetime "created_at", null: false
    t.index ["search_term_id"], name: "index_search_term_histories_on_search_term_id"
  end

  create_table "search_terms", force: :cascade do |t|
    t.string "term", null: false
    t.integer "count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["count"], name: "index_search_terms_on_count"
    t.index ["term"], name: "index_search_terms_on_term", unique: true
    t.index ["updated_at"], name: "index_search_terms_on_updated_at"
  end

end
