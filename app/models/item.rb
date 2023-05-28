class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :item_shipping_method
  belongs_to :item_prefecture
  belongs_to :item_shipping_duration

  #空の投稿を保存できないようにする
  validates :image,                   presence: true
  validates :item_name, :text,        presence: true
  validates :item_description, :text, presence: true
  validates :item_price,              presence: true

  #半角数字のみを許可し、300~9999999までの範囲
  validates :item_price, format: { with: /\A[0-9]+\z/ }, 
  numericality: { only_integer: true, 
    greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :item_category_id,          numericality: { other_than: 1 }
  validates :item_condition_id,         numericality: { other_than: 1 }
  validates :item_shipping_method_id,   numericality: { other_than: 1 }
  validates :item_prefecture_id,        numericality: { other_than: 1 }
  validates :item_shipping_duration_id, numericality: { other_than: 1 }

end
