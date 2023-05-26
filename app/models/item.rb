class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :item_shipping_method
  belongs_to :item_prefecture
  belongs_to :item_shipping_duration
end
