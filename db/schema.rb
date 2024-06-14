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

ActiveRecord::Schema[7.0].define(version: 2024_06_14_165207) do
  create_table "genetic_tests", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "test_type", null: false
    t.string "sample_type", null: false
    t.string "status", default: "scheduled", null: false
    t.date "collection_date"
    t.text "results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_genetic_tests_on_member_id"
  end

  create_table "test_results", force: :cascade do |t|
    t.integer "genetic_test_id", null: false
    t.string "gene"
    t.string "variant"
    t.string "clinical_significance"
    t.date "date_analyzed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zygosity"
    t.text "associated_conditions"
    t.text "recommendations"
    t.index ["genetic_test_id"], name: "index_test_results_on_genetic_test_id"
  end

  add_foreign_key "test_results", "genetic_tests"
end
