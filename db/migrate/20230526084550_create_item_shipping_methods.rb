class CreateItemShippingMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :item_shipping_methods do |t|

      t.timestamps
    end
  end
end
