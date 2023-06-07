require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

  describe '商品購入の保存' do
    context '商品購入の保存ができる場合' do
      it '購入に関わる全ての項目が存在すれば保存できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '商品購入の保存ができない場合' do
      it 'ユーザー情報がない場合は保存できない' do
        @purchase_shipping.user_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("ユーザーを入力してください")
      end
      it '商品情報がない場合は保存できない' do
        @purchase_shipping.item_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("商品を入力してください")
      end
      it 'postal_codeが空では保存できない' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'item_prefecture_idが1では保存できない' do
        @purchase_shipping.item_prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'cityが空では保存できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'street_addressが空では保存できない' do
        @purchase_shipping.street_address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では保存できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'postal_codeが「3桁ハイフン4桁」以外では保存できない' do
        @purchase_shipping.postal_code = '4444-333'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'postal_codeが半角数字以外では保存できない' do
        @purchase_shipping.postal_code = '０００ー００００'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'phone_numberが10桁未満では保存できない' do
        @purchase_shipping.phone_number = '123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが12桁以上では保存できない' do
        @purchase_shipping.phone_number = '123456789012'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが半角数字以外では保存できない' do
        @purchase_shipping.phone_number = '００００００００００'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空では保存できないこと' do
        @purchase_shipping.token = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end
