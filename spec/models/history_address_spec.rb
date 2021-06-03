require 'rails_helper'

RSpec.describe HistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @history_address = FactoryBot.build(:history_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it 'postalとprefecture_id,city,house_number,phone,tokenがあれば保存ができること' do
      expect(@history_address).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @history_address.building_name = nil
      expect(@history_address).to be_valid
    end
    it 'postalは半角数字３つ-半角数字４つで保存できる' do
      expect(@history_address).to be_valid
    end
    it 'phoneは11桁以内の数値なら保存できる' do
      expect(@history_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postalが空では保存ができないこと' do
      @history_address.postal = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Postal can't be blank")
    end
    it 'prefecture_idが0では登録できないこと' do
      @history_address.prefecture_id = 0
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @history_address.city = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では保存ができないこと' do
      @history_address.house_number = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phoneが空では保存ができないこと' do
      @history_address.phone = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'tokenが空では保存ができないこと' do
      @history_address.token = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @history_address.postal = '１２３４５６７'
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
    end
    it 'userが紐付いていないと保存できないこと' do
      @history_address.user_id = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @history_address.item_id = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'phoneが11桁以内の数値でなければ保存ができないこと' do
      @history_address.phone = '111111111111'
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include('Phone is invalid')
    end
  end
end
