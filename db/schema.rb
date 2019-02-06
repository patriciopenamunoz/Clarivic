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

ActiveRecord::Schema.define(version: 2019_02_06_190855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "hostel_registration_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_registration_id"], name: "index_comments_on_hostel_registration_id"
  end

  create_table "communes", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.text "description"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_communes_on_region_id"
  end

  create_table "hostel_features", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hostel_id"
    t.index ["hostel_id"], name: "index_hostel_features_on_hostel_id"
  end

  create_table "hostel_registrations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hostel_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_id"], name: "index_hostel_registrations_on_hostel_id"
    t.index ["user_id"], name: "index_hostel_registrations_on_user_id"
  end

  create_table "hostels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "commune_id"
    t.float "latitude"
    t.float "longitude"
    t.integer "address_number"
    t.index ["commune_id"], name: "index_hostels_on_commune_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.text "desciption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "hostel_registration_id"
    t.date "starting_date"
    t.date "ending_date"
    t.integer "total"
    t.boolean "payed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_registration_id"], name: "index_reservations_on_hostel_registration_id"
  end

  create_table "reserved_rooms", force: :cascade do |t|
    t.bigint "reservation_id"
    t.bigint "room_type_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reserved_rooms_on_reservation_id"
    t.index ["room_type_id"], name: "index_reserved_rooms_on_room_type_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "number_rooms"
    t.integer "value_per_night"
    t.bigint "hostel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_id"], name: "index_room_types_on_hostel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "first_surname"
    t.string "second_surname"
    t.integer "gender"
    t.text "bio"
    t.integer "access_level", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "hostel_registrations"
  add_foreign_key "communes", "regions"
  add_foreign_key "hostel_features", "hostels"
  add_foreign_key "hostel_registrations", "hostels"
  add_foreign_key "hostel_registrations", "users"
  add_foreign_key "hostels", "communes"
  add_foreign_key "reservations", "hostel_registrations"
  add_foreign_key "reserved_rooms", "reservations"
  add_foreign_key "reserved_rooms", "room_types"
  add_foreign_key "room_types", "hostels"
end
