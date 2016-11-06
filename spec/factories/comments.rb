FactoryGirl.define do
  factory :comment do
    prototype
    content { Faker::Lorem.sentence }
  end
end
