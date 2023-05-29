require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '商品出品情報の保存ができる場合' do
      it '商品出品情報に関わる全ての項目を満たせば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報の保存ができない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it 'item_category_idが1では登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item category must be other than 1'
      end
      it 'item_condition_idが1では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item condition must be other than 1'
      end
      it 'item_shipping_method_idが1では登録できない' do
        @item.item_shipping_method_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item shipping method must be other than 1'
      end
      it 'item_prefecture_idが1では登録できない' do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item prefecture must be other than 1'
      end
      it 'item_shipping_duration_idが1では登録できない' do
        @item.item_shipping_duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item shipping duration must be other than 1'
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it 'item_priceが半角数字でなければ登録できない' do
        @item.item_price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is not a number'
      end
      it 'item_priceが300以下では登録できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price must be greater than or equal to 300'
      end
      it 'item_priceが9_999_999以上では登録できない' do
        @item.item_price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price must be less than or equal to 9999999'
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
