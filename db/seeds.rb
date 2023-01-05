# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Add published status
# user_ids = User.pluck(:id)
# Post.all.each do |post|
#   post.update(
#     status: :published
#   )
# end

#Create post
# user_ids = User.pluck(:id)
# 1000.times.each do |id|
#   Post.create(
#     user_id: user_ids.sample, 
#     title: Faker::Lorem.sentence,
#     content: Faker::Lorem.sentence
#   )
# end

# 100.times.each do |id|
#   User.create!(
#     name: Faker::Name.name,
#     avatar: Faker::Avatar.image,
#     role: :user,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#   )
# end


# seed avatar with active storate
# users = User.all
# users.each do |user|
#   image = URI.parse("https://avatars.dicebear.com/api/adventurer-neutral/#{user.id}.svg").open
#   user.avatar.attach(io: image, filename: "user#{user.id}")
# end

# posts = Post.all
# posts.each do |post|
#   Tag.create(post_id: post.id, category_id: Category.find(rand(1...Category.all.count)).id)
# end
