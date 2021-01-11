FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    name          {"名前"}
    explanation   {"説明"}
    price           {10000}
    condition_id       {2}
    shipping_burden_id {2}
    prefecture_id      {2}
    shipping_date_id   {2}
    category_id        {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
