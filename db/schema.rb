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

ActiveRecord::Schema.define(version: 20141227031330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: true do |t|
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "communities", ["user_id"], name: "index_communities_on_user_id", using: :btree

  create_table "community_memberships", force: true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "community_memberships", ["community_id"], name: "index_community_memberships_on_community_id", using: :btree
  add_index "community_memberships", ["user_id"], name: "index_community_memberships_on_user_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "surename"
    t.datetime "date_of_birth"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "user_relations", force: true do |t|
    t.integer  "owner_id"
    t.integer  "user_rel_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_relations", ["owner_id"], name: "index_user_relations_on_owner_id", using: :btree
  add_index "user_relations", ["user_rel_id"], name: "index_user_relations_on_user_rel_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.string   "password",   null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
