class CreateItemPrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :item_prefectures do |t|

      t.timestamps
    end
  end
end
