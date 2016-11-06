FactoryGirl.define do
  factory :prototype do
    title       { Faker::Name.name }
    catchcopy   { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }
  end
end
