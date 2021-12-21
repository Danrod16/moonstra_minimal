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
puts "DB CLEANED!"
puts "Creating admin profile and team..."
admin_team = Team.create!(name: 'Moonstra', description: 'Awesome company of awesome people')
admin = User.create!(email: 'admin@gmail.com', first_name: 'Dani', last_name: 'Rodriguez', username: 'Danrod16', role: 'admin', password: 'password', team: admin_team)
puts "ADMINS CREATED!"
puts 'Creating faker seeds...'
20.times do
  team = Team.create!(name: Faker::Company.name, description: Faker::Company.catch_phrase)
  project = Project.create!(name: Faker::Space.galaxy, description: Faker::Lorem.paragraph, user: admin, private: false)
  team_project = TeamsProject.create!(team: team, project: project)
  rand(3..5).times do
    user = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username, role: 'regular', password: 'password', team: team)
    project_members = ProjectMember.create!(teams_project: team_project, user: user)
  end
end
seo = Category.create!(name: "SEO")
web_development = Category.create!(name: "Web development")
design = Category.create!(name: "Design")
puts 'DB CREATED!'
