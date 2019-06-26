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

ActiveRecord::Schema.define(version: 2019_06_26_040651) do

  create_table "actor_movies", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_actor_movies_on_actor_id"
    t.index ["movie_id"], name: "index_actor_movies_on_movie_id"
  end

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_transactions", force: :cascade do |t|
    t.datetime "borrow_date"
    t.datetime "return_date"
    t.integer "user_id"
    t.integer "movie_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "return_token"
    t.string "pickup_token"
  end

  create_table "movie_items", force: :cascade do |t|
    t.string "item_type"
    t.boolean "in_store", default: true
    t.date "borrow_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "genre_id"
    t.date "release_date"
    t.integer "minutes"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.text "address"
    t.string "email"
    t.string "phone_number"
    t.boolean "admin", default: false
    t.boolean "suspended", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
  end

end
