require 'faker'
include Faker

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

5.times do
  Wiki.create!(
    user:   users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
  end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
