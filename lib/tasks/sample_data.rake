namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_unit_groups
    make_units
  end
end

def make_users
  admin = User.create!(name:     "admin",
                       email:    "example@railstutorial.org",
                       password: "admin",
                       password_confirmation: "admin",
                       admin: true)
  zouh = User.create!(name:     "zouh",
                       email:    "example-1@railstutorial.org",
                       password: "zouh",
                       password_confirmation: "zouh",
                       admin: true)
  ygh = User.create!(name:     "ygh",
                       email:    "example-2@railstutorial.org",
                       password: "ygh",
                       password_confirmation: "ygh",
                       admin: true)
  yyc = User.create!(name:     "yyc",
                       email:    "example-3@railstutorial.org",
                       password: "yyc",
                       password_confirmation: "yyc",
                       admin: true)
  hhf = User.create!(name:     "hhf",
                       email:    "example-4@railstutorial.org",
                       password: "hhf",
                       password_confirmation: "hhf",
                       admin: true)
  95.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+5}@railstutorial.org"
    password  = "user"
    User.create!(name:     name,
                 email:    email,
                 password: user,
                 password_confirmation: user)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_unit_groups
  weight = UnitGroup.create!(code: "weight", name: "重量")
  capacity = UnitGroup.create!(code: "capacity", name: "容量")
  energy = UnitGroup.create!(code: "energy", name: "热量")
end

def make_units
  g = Unit.create!(code: "g", name: "克", unit_group_id: 1)
  ml = Unit.create!(code: "ml", name: "毫升", unit_group_id: 2)
  kg = Unit.create!(code: "kg", name: "千克", unit_group_id: 1)
  mg = Unit.create!(code: "mg", name: "毫克", unit_group_id: 1) 
  ug = Unit.create!(code: "μg", name: "微克", unit_group_id: 1)
  l = Unit.create!(code: "L", name: "升", unit_group_id: 2)
  kj = Unit.create!(code: "kJ", name: "千焦", unit_group_id: 3)
  kcal = Unit.create!(code: "kcal", name: "千卡", unit_group_id: 3)
end