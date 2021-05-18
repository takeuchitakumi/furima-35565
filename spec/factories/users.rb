FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name_kanji { '佐藤' }
    first_name_kanji { '太郎' }
    last_name_katakana { 'サトウ' }
    first_name_katakana { 'タロウ' }
    birthday { '1996.8.30' }
  end
end
