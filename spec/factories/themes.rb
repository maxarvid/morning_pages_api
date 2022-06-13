FactoryBot.define do
  factory :theme do
    name { Faker::Fantasy::Tolkien.location }
  end
end
