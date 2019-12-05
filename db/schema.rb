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

ActiveRecord::Schema.define(version: 2019_12_05_100920) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bids", force: :cascade do |t|
    t.integer "status"
    t.decimal "points"
    t.bigint "player_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_bids_on_player_id"
    t.index ["team_id"], name: "index_bids_on_team_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "bonus"
    t.integer "malus"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leagues_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_participations_on_league_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.integer "nationality"
    t.decimal "minimum_bid"
    t.string "pro_team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "lol_name"
    t.integer "lol_id"
    t.string "country"
    t.string "image_url", default: "https://cdn.pandascore.co/images/player/image/7754/kev1n-5mwq0zy1.png"
    t.string "role_string"
    t.integer "pro_team_id"
    t.string "pro_team_acronym"
    t.string "pro_team_image_url"
    t.string "current_videogame_name"
    t.float "kda"
    t.float "win_rate"
    t.float "creep_score_per_minute"
    t.float "kill_participation"
    t.float "kill_share"
    t.float "gold_share"
    t.integer "weekly_score"
  end

  create_table "round_challenges", force: :cascade do |t|
    t.integer "state", default: 0, null: false
    t.bigint "round_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_round_challenges_on_challenge_id"
    t.index ["round_id"], name: "index_round_challenges_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.date "date"
    t.decimal "kda"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_rounds_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.decimal "global_score", precision: 12, scale: 2
    t.bigint "user_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.integer "victory_count"
    t.integer "draw_count"
    t.integer "defeat_count"
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weekly_scores", force: :cascade do |t|
    t.decimal "score"
    t.date "date"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_weekly_scores_on_team_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bids", "players"
  add_foreign_key "bids", "teams"
  add_foreign_key "leagues", "users"
  add_foreign_key "participations", "leagues"
  add_foreign_key "participations", "users"
  add_foreign_key "round_challenges", "challenges"
  add_foreign_key "round_challenges", "rounds"
  add_foreign_key "rounds", "players"
  add_foreign_key "teams", "leagues"
  add_foreign_key "teams", "users"
  add_foreign_key "weekly_scores", "teams"
end
