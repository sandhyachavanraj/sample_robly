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

ActiveRecord::Schema.define(:version => 20121129054928) do

  create_table "account_notifications", :force => true do |t|
    t.integer  "account_id",                                              :null => false
    t.string   "by_email",                 :limit => 100, :default => ""
    t.string   "by_sms",                   :limit => 20,  :default => ""
    t.string   "emergency_contact_number", :limit => 20,  :default => ""
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  create_table "account_secret_answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "account_id"
    t.string   "value",       :limit => 100
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active",                      :default => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "company_type", :limit => 100,                    :null => false
    t.string   "company_size", :limit => 10,                     :null => false
  end

  create_table "addresses", :force => true do |t|
    t.string   "first_name",       :limit => 50,  :default => "", :null => false
    t.string   "last_name",        :limit => 50,  :default => "", :null => false
    t.string   "email",            :limit => 75,  :default => "", :null => false
    t.string   "company",          :limit => 50,  :default => "", :null => false
    t.string   "office_phone",     :limit => 20,  :default => "", :null => false
    t.string   "office_fax",       :limit => 20,  :default => "", :null => false
    t.string   "address_1",        :limit => 100, :default => "", :null => false
    t.string   "address_2",        :limit => 100, :default => "", :null => false
    t.string   "city",             :limit => 50,  :default => "", :null => false
    t.string   "state",            :limit => 50,  :default => "", :null => false
    t.string   "zip_code",         :limit => 12,  :default => "", :null => false
    t.string   "country",          :limit => 50,  :default => "", :null => false
    t.integer  "addressable_id",                                  :null => false
    t.string   "addressable_type", :limit => 20,                  :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "website",          :limit => 100, :default => "", :null => false
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.integer  "account_id",                                               :null => false
    t.string   "name",                 :limit => 100,                      :null => false
    t.string   "from_email",           :limit => 100,                      :null => false
    t.string   "subject",              :limit => 100,                      :null => false
    t.string   "reply_to",             :limit => 100,                      :null => false
    t.integer  "page_id"
    t.integer  "list_id"
    t.string   "type",                 :limit => 20
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "personalize_to_field",                :default => ""
    t.string   "status",               :limit => 10,  :default => "Draft"
    t.string   "current_section",      :limit => 20
    t.string   "design_type",          :limit => 25,  :default => ""
  end

  create_table "email_types", :force => true do |t|
    t.string   "type_name",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lists", :force => true do |t|
    t.integer  "account_id",                                                             :null => false
    t.string   "name",                                 :limit => 100,                    :null => false
    t.string   "default_from",                         :limit => 100
    t.string   "default_subject",                      :limit => 100
    t.string   "default_reply_to",                     :limit => 100
    t.string   "permission_reminder"
    t.boolean  "can_people_pick_email_format",                        :default => false
    t.string   "daily_digest_notification_email",      :limit => 100
    t.string   "daily_subscribe_notification_email",   :limit => 100
    t.string   "daily_unsubscribe_notification_email", :limit => 100
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
  end

  create_table "members", :force => true do |t|
    t.integer  "list_id",                                                     :null => false
    t.string   "name",                      :limit => 50,                     :null => false
    t.string   "email",                     :limit => 100,                    :null => false
    t.string   "landing_page_id"
    t.datetime "landing_page_created_date"
    t.boolean  "is_subscribed",                            :default => false
    t.datetime "subscription_date"
    t.datetime "unsubscription_date"
    t.integer  "email_type_id",                                               :null => false
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  create_table "payment_transactions", :force => true do |t|
    t.integer  "account_id",                                                                        :null => false
    t.integer  "subscription_id",                                                                   :null => false
    t.string   "transaction_id"
    t.string   "status_code",          :limit => 10
    t.string   "status_message",       :limit => 50
    t.string   "approval_code",        :limit => 50
    t.decimal  "amount",                             :precision => 8, :scale => 2, :default => 0.0
    t.string   "response",             :limit => 50,                               :default => ""
    t.string   "address_response",     :limit => 50,                               :default => ""
    t.string   "postal_code_response", :limit => 50,                               :default => ""
    t.string   "cv_response",          :limit => 50,                               :default => ""
    t.string   "pan",                  :limit => 50,                               :default => ""
    t.string   "card_level",           :limit => 50,                               :default => ""
    t.string   "card_type",            :limit => 50,                               :default => ""
    t.datetime "created_at",                                                                        :null => false
    t.datetime "updated_at",                                                                        :null => false
  end

  create_table "plans", :force => true do |t|
    t.decimal  "price",                    :precision => 8, :scale => 2, :default => 0.0
    t.integer  "send_limit",                                             :default => 0
    t.integer  "min_limit",                                              :default => 0
    t.integer  "max_limit",                                              :default => 0
    t.string   "type",       :limit => 20
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
  end

  create_table "questions", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "question_text"
  end

  create_table "recipients", :force => true do |t|
    t.integer  "campaign_id",               :null => false
    t.integer  "member_id",                 :null => false
    t.string   "status",      :limit => 20
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "account_id",                   :null => false
    t.integer  "plan_id",                      :null => false
    t.datetime "expires_at"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "verified_domains", :force => true do |t|
    t.integer  "account_id"
    t.string   "email",                    :limit => 100, :default => ""
    t.string   "domain_name",              :limit => 100, :default => ""
    t.string   "activation_token"
    t.datetime "activation_token_sent_at"
    t.string   "activate_code",            :limit => 20
    t.string   "status",                   :limit => 10
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

end
