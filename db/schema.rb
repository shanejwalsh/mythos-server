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

ActiveRecord::Schema[8.1].define(version: 2026_06_23_120000) do
  create_table "characters", force: :cascade do |t|
    t.integer "age"
    t.string "alias"
    t.string "alignment"
    t.boolean "alive", default: true
    t.string "bio"
    t.datetime "created_at", null: false
    t.string "feats"
    t.string "first_name"
    t.string "gender"
    t.string "last_name"
    t.string "motto"
    t.string "notes"
    t.boolean "published", default: false
    t.string "species"
    t.string "sprite_data"
    t.string "status"
    t.string "traits_negative"
    t.string "traits_positive"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "expires_at", null: false
    t.string "token", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["token"], name: "index_refresh_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_refresh_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.string "username"
  end
end
