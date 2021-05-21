class AddDayIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :day_id, :integer
  end
end
