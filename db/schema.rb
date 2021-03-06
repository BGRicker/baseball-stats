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

ActiveRecord::Schema.define(version: 20171021223653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "player_id"
    t.integer "birth_year"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "player_id"
    t.integer "year"
    t.string "league"
    t.string "team_id"
    t.integer "games", default: 0
    t.integer "at_bats", default: 0
    t.integer "runs", default: 0
    t.integer "hits", default: 0
    t.integer "doubles", default: 0
    t.integer "triples", default: 0
    t.integer "home_runs", default: 0
    t.integer "rbis", default: 0
    t.integer "stolen_bases", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
