FactoryBot.define do
  factory :item do
    
    item_name                 { Faker::Name.name }
    item_description          { Faker::Lorem.sentence }
    item_category_id          { Faker::Number.between(from: 2, to: 11) }
    item_condition_id         { Faker::Number.between(from: 2, to: 7) }
    item_shipping_method_id   { Faker::Number.between(from: 2, to: 3) }
    item_prefecture_id        { Faker::Number.between(from: 2, to: 48) }
    item_shipping_duration_id { Faker::Number.between(from: 2, to: 4) }
    item_price                { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
