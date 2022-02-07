FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    version {Faker::Lorem.sentence}
    #category_id {Faker::Lorem.sentence}
    #situation_id {Faker::Lorem.sentence}
    #burdener_id {Faker::Lorem.sentence}
    #area_id {Faker::Lorem.sentence}
    #order_day_id {Faker::Lorem.sentence}
    #price {Faker::Lorem.sentence}
    #association :user
  end
end