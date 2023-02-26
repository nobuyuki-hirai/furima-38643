FactoryBot.define do
  factory :order_buyer do
    post_code { '555-9812' }
    prefecture { 2 }
    city { '東京都' }
    address { '1-1' }
    build_name { '東京ハイツ' }
    phone_number { 12_312_341_234 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
