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

ActiveRecord::Schema.define(:version => 20121124060506) do

  create_table "tapings", :force => true do |t|
    t.datetime "taping_date"
    t.string   "ticket_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ticket_status_changes", :force => true do |t|
    t.string   "from_status"
    t.string   "to_status"
    t.integer  "taping_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ticket_status_changes", ["taping_id", "created_at"], :name => "index_ticket_status_changes_on_taping_id_and_created_at"

end