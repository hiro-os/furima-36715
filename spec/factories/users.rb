FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'00000a'}
    password_confirmation {password}
    family_name           {'山田'}
    last_name             {'太郎'}
    family_name_katakana  {'ヤマダ'}
    last_name_katakana    {'タロウ'}
    year                  {'2000-01-01'}
  end
end