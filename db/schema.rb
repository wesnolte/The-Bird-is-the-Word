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

ActiveRecord::Schema.define(:version => 20111028163153) do

  create_table "scores", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "tweets", :force => true do |t|
    t.string   "user_id"
    t.string   "id_str"
    t.datetime "twitter_created_at"
    t.string   "text"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_id"
  end

  create_table "users", :force => true do |t|
    t.string   "screen_name"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_image_url"
    t.integer  "level"
  end

  create_table "word_statistics", :force => true do |t|
    t.string   "word"
    t.datetime "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "freq"
  end

end
