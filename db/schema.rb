# encoding: UTF-8
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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

ActiveRecord::Schema.define(version: 20151021231229) do

  create_table "admins", force: :cascade do |t|
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",           limit: 255
    t.string   "first",           limit: 255
    t.string   "last",            limit: 255
    t.boolean  "acitve",                      default: true
  end

  create_table "facilitators", force: :cascade do |t|
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "in_charge"
    t.string   "email",           limit: 255
    t.string   "first",           limit: 255
    t.string   "last",            limit: 255
    t.boolean  "active",                      default: true
  end

  create_table "students", force: :cascade do |t|
    t.string   "sid",        limit: 255,                null: false
    t.integer  "ch1",                    default: 0
    t.integer  "ch2",                    default: 0
    t.integer  "ch4",                    default: 0
    t.integer  "ch6",                    default: 0
    t.integer  "ch7",                    default: 0
    t.boolean  "enrolled",               default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

end
