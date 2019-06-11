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

ActiveRecord::Schema.define(version: 2019_06_06_121429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "cpfcnpj"
    t.string "income_type"
    t.string "category"
    t.string "rating"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_clients_on_location_id"
  end

  create_table "credit_line_settings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "credit_line_id"
    t.integer "deadline_max"
    t.integer "deadline_min"
    t.string "tax_description"
    t.float "tax_max"
    t.float "tax_min"
    t.integer "client_type"
    t.integer "deadline_setup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_line_id"], name: "index_credit_line_settings_on_credit_line_id"
  end

  create_table "credit_lines", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "client_type"
    t.bigint "credit_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_type_id"], name: "index_credit_lines_on_credit_type_id"
  end

  create_table "credit_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "client_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "criteria", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "criteria_impact_definitions", force: :cascade do |t|
    t.bigint "criterium_id"
    t.float "impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["criterium_id"], name: "index_criteria_impact_definitions_on_criterium_id"
  end

  create_table "criteria_setups", force: :cascade do |t|
    t.bigint "criterium_id"
    t.string "criteria_name"
    t.string "description"
    t.float "value"
    t.float "real_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["criterium_id"], name: "index_criteria_setups_on_criterium_id"
  end

  create_table "docfiles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "file_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_type_id"], name: "index_docfiles_on_file_type_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goal_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals_reports", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "goal_category_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_category_id"], name: "index_goals_reports_on_goal_category_id"
    t.index ["location_id"], name: "index_goals_reports_on_location_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modalities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "normatives", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_data", force: :cascade do |t|
    t.string "name"
    t.bigint "location_id"
    t.bigint "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_report_data_on_location_id"
    t.index ["report_id"], name: "index_report_data_on_report_id"
  end

  create_table "report_image_data", force: :cascade do |t|
    t.string "name"
    t.bigint "location_id"
    t.bigint "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_report_image_data_on_location_id"
    t.index ["report_id"], name: "index_report_image_data_on_report_id"
  end

  create_table "report_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.bigint "report_type_id"
    t.string "action_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_type_id"], name: "index_reports_on_report_type_id"
  end

  create_table "requisition_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requisition_notes", force: :cascade do |t|
    t.bigint "requisition_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requisition_id"], name: "index_requisition_notes_on_requisition_id"
  end

  create_table "requisition_statuses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requisitions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "requisition_status_id"
    t.bigint "requisition_category_id"
    t.string "requisition_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "requester_id"
    t.integer "flag"
    t.bigint "location_id"
    t.bigint "client_id"
    t.bigint "modality_id"
    t.bigint "submodality_id"
    t.float "value"
    t.string "requisition_number"
    t.bigint "sector_flow_id"
    t.index ["client_id"], name: "index_requisitions_on_client_id"
    t.index ["location_id"], name: "index_requisitions_on_location_id"
    t.index ["modality_id"], name: "index_requisitions_on_modality_id"
    t.index ["requisition_category_id"], name: "index_requisitions_on_requisition_category_id"
    t.index ["requisition_status_id"], name: "index_requisitions_on_requisition_status_id"
    t.index ["sector_flow_id"], name: "index_requisitions_on_sector_flow_id"
    t.index ["submodality_id"], name: "index_requisitions_on_submodality_id"
  end

  create_table "sector_flows", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_sector_flows_on_sector_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_actions", force: :cascade do |t|
    t.bigint "requisition_id"
    t.datetime "start"
    t.datetime "finish"
    t.text "description"
    t.bigint "requisition_status_id"
    t.string "action_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sector_flow_id"
    t.index ["requisition_id"], name: "index_status_actions_on_requisition_id"
    t.index ["requisition_status_id"], name: "index_status_actions_on_requisition_status_id"
    t.index ["sector_flow_id"], name: "index_status_actions_on_sector_flow_id"
  end

  create_table "submodalities", force: :cascade do |t|
    t.string "title"
    t.text "despcription"
    t.bigint "modality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modality_id"], name: "index_submodalities_on_modality_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login"
    t.string "role"
    t.date "birthday"
    t.integer "kind"
    t.string "full_name"
    t.bigint "sector_id"
    t.bigint "location_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sector_id"], name: "index_users_on_sector_id"
  end

  add_foreign_key "clients", "locations"
  add_foreign_key "credit_line_settings", "credit_lines"
  add_foreign_key "credit_lines", "credit_types"
  add_foreign_key "criteria_impact_definitions", "criteria"
  add_foreign_key "criteria_setups", "criteria"
  add_foreign_key "docfiles", "file_types"
  add_foreign_key "goals_reports", "goal_categories"
  add_foreign_key "goals_reports", "locations"
  add_foreign_key "report_data", "locations"
  add_foreign_key "report_data", "reports"
  add_foreign_key "report_image_data", "locations"
  add_foreign_key "report_image_data", "reports"
  add_foreign_key "reports", "report_types"
  add_foreign_key "requisition_notes", "requisitions"
  add_foreign_key "requisitions", "clients"
  add_foreign_key "requisitions", "locations"
  add_foreign_key "requisitions", "modalities"
  add_foreign_key "requisitions", "requisition_categories"
  add_foreign_key "requisitions", "requisition_statuses"
  add_foreign_key "requisitions", "sector_flows"
  add_foreign_key "requisitions", "submodalities"
  add_foreign_key "sector_flows", "sectors"
  add_foreign_key "status_actions", "requisition_statuses"
  add_foreign_key "status_actions", "requisitions"
  add_foreign_key "status_actions", "sector_flows"
  add_foreign_key "submodalities", "modalities"
  add_foreign_key "users", "locations"
  add_foreign_key "users", "sectors"
end
