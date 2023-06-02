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

  def purchase_address_params
    params.require(:purchase_shipping).permit(:postal_code, :item_prefecture_id, :city, :street_address, :building_name, 
      :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]
    )
  end

end