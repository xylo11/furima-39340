class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :item_prefecture_id, :city, :street_address, :building_name, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code    format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :street_address
    validates :phone_number   format: {with: /\A[0-9]{10,11}\z/}
  end
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :item_prefecture_id, numericality: { other_than: 1 }

  def save
      # 各テーブルにデータを保存する処理を書く
  end
end