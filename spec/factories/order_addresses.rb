FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '大阪府' }
    house_number { '1-1' }
    building_name { '梅田ビル' }
    phone_number { '09000000000' }
    token { "tok_000000000"}
  end
end
