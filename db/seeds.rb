User.create!(name: "Stella Njage",
             email: "stellanjage@yahoo.com",
             password: "rainbow",
             password_confirmation: "rainbow",
             mobile_number: "0123456789",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

29.times do |n|
  name = Faker::Name.name
  email = "stellanjage-#{n+1}@yahoo.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password:             password,
               password_confirmation: password,
               mobile_number: "1234567890",
               activated: true,
               activated_at: Time.zone.now)
end
100.times do |b|
  isbn = Faker::Code.isbn
  title = Faker::Book.title
  description = Faker::Lorem.sentence
  quantity = Faker::Number.between(1, 10)
  Book.create!( ISBN: isbn,
                title: title,
                description: description,
                quantity: quantity
                )
  puts "#{title}, "
end
