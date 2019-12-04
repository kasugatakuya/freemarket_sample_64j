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

ActiveRecord::Schema.define(version: 20191204042158) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "post_cord",                 null: false
    t.string   "prefectures",               null: false
    t.string   "city",                      null: false
    t.string   "address",                   null: false
    t.text     "building",    limit: 65535
    t.integer  "user_id",                   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "brand_name", null: false
  end

  create_table "brands_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "brand_id", null: false
    t.integer "group_id", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category_name", null: false
  end

  create_table "commnets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "comment", limit: 65535, null: false
    t.integer "item_id",               null: false
    t.integer "user_id",               null: false
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "brand_type", null: false
  end

  create_table "item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "image",   limit: 65535
    t.integer "item_id",               null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.string   "size"
    t.string   "conndition",                    null: false
    t.string   "shipping_method",               null: false
    t.string   "shipping_days",                 null: false
    t.string   "shipping_area",                 null: false
    t.integer  "shipping_price",                null: false
    t.integer  "item_price",                    null: false
    t.text     "item_text",       limit: 65535, null: false
    t.integer  "user_id",                       null: false
    t.integer  "brand_id",                      null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "message",   limit: 65535, null: false
    t.integer "item_id",                 null: false
    t.integer "buyer_id",                null: false
    t.integer "seller_id",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                          null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "last_name_kana",                                    null: false
    t.text     "icon",                   limit: 65535
    t.string   "birthday",                                          null: false
    t.text     "text",                   limit: 65535,              null: false
    t.integer  "telephone",                                         null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end