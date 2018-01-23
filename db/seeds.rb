require 'faker'
include Faker



5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

20.times do
  Wiki.create!(
    user:   users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph,
    private: Faker::Boolean.boolean
  )
  end

admin = User.create!(
    email: 'admin@admin.com',
    password: 'Mowgli11@',
    role: 'admin'
  )

  premium = User.create!(
      email: 'prem@prem.com',
      password: 'Mowgli11@',
      role: 'premium'
    )

  standard = User.create!(
        email: 'standard@standard.com',
        password: 'Mowgli11@',
        role: 'standard'
      )




puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
