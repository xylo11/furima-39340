FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { Gimei.name.last.kanji }
    first_name { Gimei.name.first.kanji }
    family_name_kana { Gimei.name.first.katakana }
    first_name_kana { Gimei.name.last.katakana }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 92) }
  end
end
