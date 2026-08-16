FactoryBot.define do
  factory :item do
    item_name { 'テスト商品' }
    description { '商品の説明です' }
    category_id { 2 }
    condition_id { 2 }
    prefecture_id { 2 }
    shipping_fee_id { 2 }
    shipping_day_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open('spec/fixtures/test_image.jpg'),
        filename: 'test_image.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
