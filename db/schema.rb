# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_20_111359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "cif"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deliverables", force: :cascade do |t|
    t.string "title"
    t.integer "price", default: 0
    t.integer "time_alocation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_project_categories_on_category_id"
    t.index ["project_id"], name: "index_project_categories_on_project_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.bigint "teams_project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teams_project_id"], name: "index_project_members_on_teams_project_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "finders_fee", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "private"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "proposal_deliverables", force: :cascade do |t|
    t.bigint "deliverable_id", null: false
    t.bigint "proposal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deliverable_id"], name: "index_proposal_deliverables_on_deliverable_id"
    t.index ["proposal_id"], name: "index_proposal_deliverables_on_proposal_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.text "goals"
    t.integer "total_price", default: 0
    t.date "expiry_date"
    t.bigint "client_id", null: false
    t.bigint "teams_project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_proposals_on_client_id"
    t.index ["teams_project_id"], name: "index_proposals_on_teams_project_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "primary_color"
    t.text "description"
    t.text "terms_and_conditions"
    t.string "banner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "diamonds", default: 0
  end

  create_table "teams_projects", force: :cascade do |t|
    t.string "status", default: "pending"
    t.bigint "team_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_teams_projects_on_project_id"
    t.index ["team_id"], name: "index_teams_projects_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "role", default: "regular"
    t.string "job_title"
    t.string "team_role", default: "astronaut"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "project_members", "teams_projects"
  add_foreign_key "project_members", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "proposal_deliverables", "deliverables"
  add_foreign_key "proposal_deliverables", "proposals"
  add_foreign_key "proposals", "clients"
  add_foreign_key "proposals", "teams_projects"
  add_foreign_key "teams_projects", "projects"
  add_foreign_key "teams_projects", "teams"
  add_foreign_key "users", "teams"
end
