User.create!(name: "Stella Njage",
             email: "stellanjage@yahoo.com",
             password: "rainbow",
             password_confirmation: "rainbow",
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
               activated: true,
               activated_at: Time.zone.now)
end
