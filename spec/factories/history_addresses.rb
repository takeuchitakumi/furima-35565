FactoryBot.define do
  factory :history_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { 'プレジオ栄' }
    phone { '09011112222' }
  end
end
