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

ActiveRecord::Schema.define(:version => 20130727171516) do

  create_table "households", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "adult_one_firstname"
    t.string   "adult_one_lastname"
    t.string   "adult_one_email"
    t.string   "adult_one_phone"
    t.boolean  "adult_one_text"
    t.string   "adult_two_firstname"
    t.string   "adult_two_lastname"
    t.string   "adult_two_email"
    t.string   "adult_two_phone"
    t.boolean  "adult_two_text"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "school_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "school_class_id"
    t.integer  "primary_household_id"
    t.integer  "secondary_household_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
