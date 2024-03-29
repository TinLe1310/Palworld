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

ActiveRecord::Schema[7.1].define(version: 2024_02_29_044107) do
  create_table "drops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "context"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pal_drops", force: :cascade do |t|
    t.integer "pal_id", null: false
    t.integer "drop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drop_id"], name: "index_pal_drops_on_drop_id"
    t.index ["pal_id"], name: "index_pal_drops_on_pal_id"
  end

  create_table "pal_types", force: :cascade do |t|
    t.integer "pal_id", null: false
    t.integer "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pal_id"], name: "index_pal_types_on_pal_id"
    t.index ["type_id"], name: "index_pal_types_on_type_id"
  end

  create_table "pals", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "skill"
    t.integer "hp"
    t.integer "attack"
    t.integer "speed"
    t.integer "rarity"
    t.integer "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_pals_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pal_drops", "drops"
  add_foreign_key "pal_drops", "pals"
  add_foreign_key "pal_types", "pals"
  add_foreign_key "pal_types", "types"
  add_foreign_key "pals", "regions"
end
