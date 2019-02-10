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

ActiveRecord::Schema.define(version: 2019_02_09_183852) do

  create_table "flowers", force: :cascade do |t|
    t.string "flower_name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipe_id"
    t.index ["recipe_id"], name: "index_flowers_on_recipe_id"
  end

  create_table "masterflowers", force: :cascade do |t|
    t.string "masterflower_name"
    t.integer "masterflower_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wedding_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["wedding_id"], name: "index_order_items_on_wedding_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_name"
    t.string "recipe_ingredient"
    t.integer "recipe_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wedding_id"
    t.text "notes"
    t.index ["wedding_id"], name: "index_recipes_on_wedding_id"
  end

  create_table "weddings", force: :cascade do |t|
    t.string "wedding_name"
    t.date "wedding_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
  end

end
