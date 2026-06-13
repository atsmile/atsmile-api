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

ActiveRecord::Schema[8.1].define(version: 2026_06_13_095201) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "careers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "is_current"
    t.string "period"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text "bio"
    t.datetime "created_at", null: false
    t.string "experience"
    t.string "github"
    t.string "hobby"
    t.string "location"
    t.string "name"
    t.string "now"
    t.string "role"
    t.string "role_ja"
    t.datetime "updated_at", null: false
  end

  create_table "skill_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "label"
    t.integer "position"
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "level"
    t.string "name"
    t.integer "position"
    t.bigint "skill_group_id", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_group_id"], name: "index_skills_on_skill_group_id"
  end

  create_table "work_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "work_id", null: false
    t.index ["work_id"], name: "index_work_tags_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "anon_url"
    t.string "basic_auth_password"
    t.string "basic_auth_user"
    t.string "category"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "image"
    t.string "link_label"
    t.integer "position"
    t.boolean "public_only"
    t.string "slug"
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "url"
  end

  add_foreign_key "skills", "skill_groups"
  add_foreign_key "work_tags", "works"
end
