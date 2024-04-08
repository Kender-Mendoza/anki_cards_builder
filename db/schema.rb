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

ActiveRecord::Schema[7.0].define(version: 2024_04_04_163239) do
  create_table "definitions", force: :cascade do |t|
    t.string "explanation"
    t.string "context"
    t.integer "part_of_speach_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_of_speach_id"], name: "index_definitions_on_part_of_speach_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "term"
    t.string "audio_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "part_of_speaches", force: :cascade do |t|
    t.string "speach_type"
    t.integer "entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_part_of_speaches_on_entry_id"
  end

  add_foreign_key "definitions", "part_of_speaches"
  add_foreign_key "part_of_speaches", "entries"
end
