require 'faker'

# Create user
User.create(username: "alerodrom", password: "123456789abc", age: 26)

# Create 10 Users with random username
10.times do
    user = User.create(username: Faker::Internet.username, password: "123456789abc", age: 26)
end