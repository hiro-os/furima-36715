FactoryBot.define do
  factory :user do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    family_name           {Gimei.name.first.kanji}
    last_name             {Gimei.name.last.kanji}
    family_name_katakana  {Gimei.name.first.katakana}
    last_name_katakana    {Gimei.name.last.katakana}
    year                  {Faker::Date.backward}
  end
end