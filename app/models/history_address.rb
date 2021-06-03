class HistoryAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :house_number, :building_name, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, phone: phone, history_id: history.id)
  end
end
