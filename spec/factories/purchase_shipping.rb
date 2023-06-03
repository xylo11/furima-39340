FactoryBot.define do
  factory :purchase_shipping do
    postal_code        { '111-1111' }
    item_prefecture_id { 38 }
    city               { '高松市' }
    street_address     { '1-1' }
    building_name      { 'シンボルタワー' }
    phone_number       { '00000000000' }
    token    { 'tok_abcdefghijk00000000000000000' }
  end
end