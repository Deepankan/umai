# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "***************** Creating User Start ***************************"
200.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password )
end

puts "***************** Creating User End ***************************"


puts "***************** Creating Post Start ***************************"
2000.times do
  Post.create(user_id: User.order('RANDOM()').first.id, title: Faker::Name.name, content: Faker::Quote.famous_last_words, ip: Faker::Internet.ip_v4_address )
end
puts "***************** Creating Post End ***************************"


puts "***************** Creating Rating for Post Start ***************************"

2000.times do
  Rating.create(post_id: User.order('RANDOM()').first.id, user_id: User.order('RANDOM()').first.id, value: [0,1,2,3,4].sample)
end
puts "***************** Creating Rating for Post End ***************************"