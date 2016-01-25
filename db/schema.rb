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

ActiveRecord::Schema.define(version: 20160123114853) do

  create_table "given_answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "survey_id"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "given_answers", ["question_id"], name: "index_given_answers_on_question_id", using: :btree
  add_index "given_answers", ["survey_id"], name: "index_given_answers_on_survey_id", using: :btree
  add_index "given_answers", ["user_id"], name: "index_given_answers_on_user_id", using: :btree

  create_table "options", force: true do |t|
    t.text     "ans_content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "que_content",    null: false
    t.string   "types"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "answer_options"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
