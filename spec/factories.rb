FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :nutrition_fact do
    code "00-0-000"
    name "营养素参考值（NRV）"
    size_unit_id 1 
    size 100.0 
    serving_size 100.0
    servings 1.0
    energy 8400.0
    energy_percent 100
    protein 60.0
    protein_percent 100
    fat 60.0
    fat_percent 100
    carbohydrate 300.0
    carbohydrate_percent 100
    sodium 2000.0
    sodium_percent 100
    created_by 1
    updated_by 1
  end

  factory :unit_group do
    code "weight"
    name "重量"
  end  

  factory :unit do
    code "g"
    name "克"
    unit_group
  end
end