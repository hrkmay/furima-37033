FactoryBot.define do
  factory :record_address do
    token {"tok_abcdefghijk00000000000000000"}
    postial_code { '123-4567' }
    place_id { 3 }
    city { '岐阜市' }
    house_number { '1-1' }
    phone_number { '12345678912'}
    building_name { '東京ハイツ' }
  end
end
