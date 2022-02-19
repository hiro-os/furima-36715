FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    area_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street { '1-1' }
    phone { '09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end