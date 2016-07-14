User.create!(name: "Stella Njage",
             email: "stellanjage@yahoo.com",
             password: "raibow",
             password_confirmation: "rainbow")
29.times do |n|
  name = Faker::Name.name
  email = "stellanjage-#{n+1}@yahoo.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password:             password,
              password_confirmation: password)
end
