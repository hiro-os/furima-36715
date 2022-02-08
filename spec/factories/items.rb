FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    version {Faker::Lorem.sentence}
    category_id {2}
    situation_id {2}
    burdener_id {2}
    area_id {2}
    order_day_id {2}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-footer.png'), filename: 'furima-footer.png')
    end
  end
end