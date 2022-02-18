FactoryBot.define do
  factory :donation_address do
    postcode { '123-4567' }
    area_id { 1 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end