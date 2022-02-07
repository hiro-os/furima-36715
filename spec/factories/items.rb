FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    version {Faker::Lorem.sentence}
    category_id {Faker::Number.number}
    situation_id {Faker::Number.number}
    burdener_id {Faker::Number.number}
    area_id {Faker::Number.number}
    order_day_id {Faker::Number.number}
    price {Faker::Number.between(from: 301, to: 9999999)}
    #association :user
  end
end