FactoryBot.define do
  factory :item do
    title             { '商品名' }
    price             { '50000' }
    concept           { '説明文' }
    category_id       { '2' }
    condition_id      { '2' }
    postage_payer_id  { '2' }
    ship_area_id      { '2' }
    ship_day_id      { '2' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
