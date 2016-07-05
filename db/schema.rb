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

ActiveRecord::Schema.define(version: 20160705230240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.string "share_title"
    t.string "share_description"
    t.string "share_image_id"
    t.string "contact_email"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.string "google_analytics_code"
    t.text   "mission"
    t.text   "disclaimer"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "path",        null: false
    t.string   "name",        null: false
    t.string   "website",     null: false
    t.string   "logo"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pages", force: :cascade do |t|
    t.boolean  "active",     default: false, null: false
    t.integer  "rank",       default: 100,   null: false
    t.string   "path",                       null: false
    t.string   "name",                       null: false
    t.text     "text"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["active", "rank"], name: "index_pages_on_active_and_rank", using: :btree
    t.index ["active"], name: "index_pages_on_active", using: :btree
    t.index ["path"], name: "index_pages_on_path", using: :btree
    t.index ["rank"], name: "index_pages_on_rank", using: :btree
  end

  create_table "procedures", force: :cascade do |t|
    t.integer  "organization_id",                 null: false
    t.boolean  "active",          default: false, null: false
    t.integer  "rank",            default: 100,   null: false
    t.string   "name",                            null: false
    t.string   "codes",           default: [],    null: false, array: true
    t.integer  "price",                           null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["active"], name: "index_procedures_on_active", using: :btree
    t.index ["organization_id"], name: "index_procedures_on_organization_id", using: :btree
    t.index ["rank"], name: "index_procedures_on_rank", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "organization_id",                 null: false
    t.boolean  "admin",           default: false, null: false
    t.string   "email",                           null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["admin"], name: "index_users_on_admin", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["last_name", "first_name"], name: "index_users_on_last_name_and_first_name", using: :btree
    t.index ["organization_id"], name: "index_users_on_organization_id", using: :btree
  end

end
