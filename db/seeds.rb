require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.times do
    User.create!(
                email: Faker::Internet.email,
                password: Faker::Config.random.seed
                )
end
users = User.all

1.times do
    Wiki.create!(
                user: users.sample,
                title: Faker::Company.bs,
                body: Faker::Company.bs,
                private: false
                )
end
wikis = Wiki.all

puts "Seed finished."
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
