include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :prototype_thumbnail do
    image { fixture_file_upload("spec/fixtures/img/sample.jpg") }
    trait :main do
      state :main
    end

    trait :sub do
      state :sub
    end
    prototype
  end
end
