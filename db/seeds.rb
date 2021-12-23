# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning DB..."

User.delete_all
Team.delete_all
Project.delete_all
ProjectMember.delete_all
Category.delete_all


puts "Creating project categories"


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
    client = Client.create!(company_name: Faker::Company.name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.full_address, cif: Faker::Address.postcode, email: Faker::Internet.email)
    Proposal.create!(title: Faker::Quote.famous_last_words, overview: Faker::Lorem.paragraph, goals: Faker::Lorem.paragraph, total_price: rand(100..1000), expiry_date: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'), client: client, teams_project: moonstra_team_project, status: "pending")
  end
end
other_client = Client.create!(company_name: Faker::Company.name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.full_address, cif: Faker::Address.postcode, email: Faker::Internet.email)
other_team = Team.create!(name: 'other', description: 'Awesome company of awesome people')
other = User.create!(email: 'other@gmail.com', first_name: 'Other', last_name: 'Other', username: 'Other16', role: 'admin', password: 'password', team: other_team)
other_project = Project.create!(name: Faker::Space.galaxy, description: Faker::Lorem.paragraph, user: other, private: false)
other_team_project = TeamsProject.create!(team: other_team, project: other_project)
Proposal.create!(title: "This is a test", overview: Faker::Lorem.paragraph, goals: Faker::Lorem.paragraph, total_price: rand(100..1000), expiry_date: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'), client: other_client, teams_project: other_team_project, status: "pending")

moonstra_project = Project.create!(name: Faker::Space.galaxy, description: Faker::Lorem.paragraph, user: dani, private: false)
moonstra_team_project = TeamsProject.create!(team: moonstra, project: moonstra_project)
client = Client.create!(company_name: Faker::Company.name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.full_address, cif: Faker::Address.postcode, email: Faker::Internet.email)
Proposal.create!(title: "You did it! Congrats! You are a genius!", overview: Faker::Lorem.paragraph, goals: Faker::Lorem.paragraph, total_price: rand(100..1000), expiry_date: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'), client: client, teams_project: moonstra_team_project, status: "pending")

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

puts 'DB CREATED!'
