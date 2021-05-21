FactoryBot.define do
  factory :item do
    association :user

    title { 'オムライス' }
    description { '黄色' }
    category_id { 2 }
    status_id { 2 }
    fee_id { 2 }
    area_id { 2 }
    day_id { 2 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
