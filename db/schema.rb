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

ActiveRecord::Schema[7.0].define(version: 2022_07_26_160557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "measurement_unit", default: "g"
    t.float "price", default: 0.0
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "name"
    t.float "preparation_time", default: 0.0
    t.float "cooking_time", default: 0.0
    t.text "description", default: ""
    t.boolean "public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "recipe_foods", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "receipt_id", null: false
    t.bigint "food_id", null: false
    t.index ["food_id"], name: "index_recipe_foods_on_food_id"
    t.index ["receipt_id"], name: "index_recipe_foods_on_receipt_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "foods", "users"
  add_foreign_key "receipts", "users"
  add_foreign_key "recipe_foods", "foods"
  add_foreign_key "recipe_foods", "receipts"
end
