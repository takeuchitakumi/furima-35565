class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal,        null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :house_number,  null: false
      t.string     :building_name
      t.string     :phone,         null: false
      t.references :history,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
