require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
# 5.times do
#   User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
# end

5.times do
  User.create(:username => Faker::Name.name, :email => Faker::Internet.email, :password => 'password')
end

User.all.each do |user|
  10.times do
    user.tweets << Tweet.new(message: Faker::Lorem.sentence)
  end
end
