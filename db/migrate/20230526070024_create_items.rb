class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :item_name,                 null: false
      t.text      :item_description,          null: false
      t.integer   :item_category_id,          null: false
      t.integer   :item_condition_id,         null: false
      t.integer   :item_shipping_method_id,   null: false
      t.integer   :item_prefecture_id,        null: false
      t.integer   :item_shipping_duration_id, null: false
      t.references :user,                      null: false, foreign_key: true
      t.timestamps
    end
  end
end
