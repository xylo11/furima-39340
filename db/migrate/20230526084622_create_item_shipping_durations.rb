class CreateItemShippingDurations < ActiveRecord::Migration[6.0]
  def change
    create_table :item_shipping_durations do |t|

      t.timestamps
    end
  end
end
