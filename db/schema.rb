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

ActiveRecord::Schema.define(version: 2019_07_27_204630) do

  create_table "boards", force: :cascade do |t|
    t.string "characters", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_histories", force: :cascade do |t|
    t.integer "game_id", null: false
    t.string "word", null: false
    t.boolean "accepted", default: false, null: false
    t.integer "points", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "word"], name: "index_game_histories_on_game_id_and_word", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.integer "board_id", null: false
    t.integer "duration", null: false
    t.string "token", null: false
    t.integer "points", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_games_on_token", unique: true
  end

end
