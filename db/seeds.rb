# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning DB..."
User.destroy_all
Team.destroy_all
Project.destroy_all
ProjectMember.destroy_all
Category.destroy_all

seo = Category.create!(name: "SEO")
web_development = Category.create!(name: "Web development")
design = Category.create!(name: "Design")

puts "DB CLEANED!"
puts "Creating admin profile and team..."
moonstra = Team.create!(name: 'Moonstra', description: 'Awesome company of awesome people')
dani = User.create!(email: 'admin@gmail.com', first_name: 'Dani', last_name: 'Rodriguez', username: 'Danrod16', role: 'admin', password: 'password', team: moonstra)
alex = User.create!(email:'member@gmail.com', first_name: 'Alex', last_name: 'Gorina', username: 'AGorinam', role:'regular', password: 'password', team: moonstra)
puts "Creating Moonstra projects"
5.times do
  moonstra_project = Project.create!(name: Faker::Space.galaxy, description: Faker::Lorem.paragraph, user: dani, private: false)
  moonstra_team_project = TeamsProject.create!(team: moonstra, project: moonstra_project)
  ProjectMember.create!(teams_project: moonstra_team_project, user: dani)
  ProjectMember.create!(teams_project: moonstra_team_project, user: alex)
  rand(2..4).times do
    Proposal.create!(title: Faker::Quote.famous_last_words, overview: Faker::Lorem.paragraphs(sentence_count: rand(10..15)), goals: Faker::Lorem.paragraphs(sentence_count: rand(2..5)) , total_price: rand(100..1000), exprire_date: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'), client: Faker::Company.name, teams_project: moonstra_team_project)
  end
end
puts "ADMINS CREATED!"
puts 'Creating faker seeds...'
20.times do
  team = Team.create!(name: Faker::Company.name, description: Faker::Company.catch_phrase)
  project = Project.create!(name: Faker::Space.galaxy, description: Faker::Lorem.paragraph, user: dani, private: false)
  team_project = TeamsProject.create!(team: team, project: project)
  rand(3..5).times do
    user = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username, role: 'regular', password: 'password', team: team)
    project_members = ProjectMember.create!(teams_project: team_project, user: user)
  end
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
puts "Creating project categories"

puts 'DB CREATED!'
