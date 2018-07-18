require 'faker'

def create_users_with_todo_items(user_count, email_address=nil, password=nil)
  user_count.times do
    u = User.new(
      email: email_address || Faker::Internet.safe_email,
      password: password || Faker::Internet.password
    )
    u.skip_confirmation!

    10.times do
      t = Faker::MostInterestingManInTheWorld.quote
      u.items << Item.create({name: t})
    end
    u.save
  end
end

create_users_with_todo_items(10)

# Create a test account with familiar email address
create_users_with_todo_items(1, 'test@test.com', 'password')

users = User.all
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
