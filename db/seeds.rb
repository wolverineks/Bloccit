# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
 
 
# Create Topics
5.times do 
  tmp_file = open(Faker::Avatar.image)
  FileUtils.mv tmp_file, '/tmp/avatar.png'
  
  topic = Topic.create!(
    name:        Faker::Lorem::sentence,
    description: Faker::Lorem.paragraph,
    image:       File.open('/tmp/avatar.png') 
  )
end
topics = Topic.all

# Create Users |
5.times do 
  tmp_file = open(Faker::Avatar.image)
  FileUtils.mv tmp_file, '/tmp/avatar.png'

  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    avatar:   File.open('/tmp/avatar.png') 
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Posts |
50.times do 
  tmp_file = open(Faker::Avatar.image)
  FileUtils.mv tmp_file, '/tmp/avatar.png'

  post = Post.create!(
    user:  users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph,
    topic: topics.sample,
    image: File.open('/tmp/avatar.png') 
  )

  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.update_rank

end
posts = Post.all 

500.times do 
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

 # Create an admin user
 tmp_file = open(Faker::Avatar.image)
 FileUtils.mv tmp_file, '/tmp/avatar.png'

 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin',
   avatar:   File.open('/tmp/avatar.png') 

 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 tmp_file = open(Faker::Avatar.image)
 FileUtils.mv tmp_file, '/tmp/avatar.png'

 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator',
   avatar:    File.open('/tmp/avatar.png') 

 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 tmp_file = open(Faker::Avatar.image)
 FileUtils.mv tmp_file, '/tmp/avatar.png'

 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
   avatar:    File.open('/tmp/avatar.png') 
 )
 member.skip_confirmation!
 member.save!

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
