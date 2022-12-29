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

ActiveRecord::Schema[7.0].define(version: 2022_12_29_110829) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forum_categories", force: :cascade do |t|
    t.string "name"
    t.string "latest_thread"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "thread_count"
    t.string "url"
    t.string "subtitle"
  end

  create_table "forum_threads", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.bigint "forum_category_id", null: false
    t.index ["forum_category_id"], name: "index_forum_threads_on_forum_category_id"
    t.index ["user_id"], name: "index_forum_threads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "forum_threads", "forum_categories"
  add_foreign_key "forum_threads", "users"
end
