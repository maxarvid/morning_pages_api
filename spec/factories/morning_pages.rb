FactoryBot.define do
  factory :morning_page do
    title { Faker::Books::Dune.quote }
    body { Faker::Lorem.paragraph }
    user
  end
end
