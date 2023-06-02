class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :item_shipping_method
  belongs_to :item_prefecture
  belongs_to :item_shipping_duration

  # 空の投稿を保存できないようにする
  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :item_description, presence: true
  validates :item_price,       presence: true

  # 半角数字のみを許可し、300~9999999の間のみ許可
  validates :item_price,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :item_category_id,          numericality: { other_than: 1 }
  validates :item_condition_id,         numericality: { other_than: 1 }
  validates :item_shipping_method_id,   numericality: { other_than: 1 }
  validates :item_prefecture_id,        numericality: { other_than: 1 }
  validates :item_shipping_duration_id, numericality: { other_than: 1 }
end
