require 'faker'

# Create user
base_user = User.create(username: "alerodrom", password: "123456789abc", age: 26)
5.times do
    Pixel.create(user: base_user, axis_x: rand(1..10), axis_y: rand(1..10))
end

# Create 10 Users with random username
10.times do
    user = User.create(username: Faker::Internet.username, password: "123456789abc", age: 26)
    5.times do
        Pixel.create(user: user, axis_x: rand(1..10), axis_y: rand(1..10))
    end
end