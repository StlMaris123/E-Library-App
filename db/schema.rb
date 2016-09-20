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

ActiveRecord::Schema.define(version: 20160920053018) do

  create_table "books", force: :cascade do |t|
    t.string   "ISBN"
    t.string   "title"
    t.string   "description"
    t.integer  "quantity"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "available",   default: true
    t.integer  "user_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "leases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "status",     default: 0
    t.float    "charges"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "due_date"
    t.datetime "start_date"
    t.datetime "over_due"
    t.index ["book_id"], name: "index_leases_on_book_id"
    t.index ["user_id", "book_id"], name: "index_leases_on_user_id_and_book_id", unique: true
    t.index ["user_id"], name: "index_leases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "mobile_number"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
