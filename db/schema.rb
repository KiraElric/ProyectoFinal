# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_07_032658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appraisals", force: :cascade do |t|
    t.text "review", null: false
    t.integer "score", default: 0
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_appraisals_on_book_id"
    t.index ["user_id"], name: "index_appraisals_on_user_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastname", null: false
    t.integer "nationality", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_collections", force: :cascade do |t|
    t.integer "state", default: 0
    t.boolean "owned", default: true
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id", "user_id"], name: "index_book_collections_on_book_id_and_user_id", unique: true
    t.index ["book_id"], name: "index_book_collections_on_book_id"
    t.index ["user_id"], name: "index_book_collections_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "isbn", null: false
    t.integer "language", default: 0
    t.integer "genre", default: 0
    t.text "description"
    t.bigint "author_id", null: false
    t.bigint "publisher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "lastname", null: false
    t.integer "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appraisals", "books"
  add_foreign_key "appraisals", "users"
  add_foreign_key "book_collections", "books"
  add_foreign_key "book_collections", "users"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "publishers"
end
