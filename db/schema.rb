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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121130101437) do

  create_table "status_changes", :force => true do |t|
    t.string   "from_status"
    t.string   "to_status"
    t.integer  "ticket_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "status_changes", ["ticket_id", "created_at"], :name => "index_ticket_status_changes_on_taping_id_and_created_at"

  create_table "tickets", :force => true do |t|
    t.date     "date"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trackings", :force => true do |t|
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trackings_users", :id => false, :force => true do |t|
    t.integer "tracking_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.boolean  "track_all"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
