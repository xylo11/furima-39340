class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: [:index, :create]

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:postal_code, :item_prefecture_id, :city, :street_address, :building_name, 
      :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]
    )
  end

  # ログイン状態の場合でも、自身が出品していない売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移する
  # ログイン状態の場合でも、自身が出品した商品の商品購入ページに遷移しようとすると、商品の販売状況に関わらずトップページに遷移する
  def move_to_root
    @item = Item.find(params[:item_id])
    return unless current_user.id == @item.user_id || @item.purchase_record.present?

    redirect_to root_path
  end

  def pay_item #payjpの設定後実装
  end

end