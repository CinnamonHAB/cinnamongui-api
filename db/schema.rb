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

ActiveRecord::Schema.define(version: 20170102192027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "domains", force: :cascade do |t|
    t.text     "name"
    t.integer  "floorplan_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "floorplan_objects", force: :cascade do |t|
    t.float    "angle"
    t.text     "background_color"
    t.text     "fill"
    t.float    "height"
    t.float    "width"
    t.float    "left"
    t.float    "top"
    t.float    "opacity"
    t.float    "scale_x"
    t.float    "scale_y"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "type"
  end

  create_table "floorplans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "predicate_params", force: :cascade do |t|
    t.text     "name"
    t.text     "param_type"
    t.integer  "predicate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "predicates", force: :cascade do |t|
    t.text     "keyword"
    t.integer  "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
