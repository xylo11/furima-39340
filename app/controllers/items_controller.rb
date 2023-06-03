class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description,
                                 :item_category_id, :item_condition_id, :item_shipping_method_id,
                                 :item_prefecture_id, :item_shipping_duration_id,
                                 :item_price).merge(user_id: current_user.id)
  end

  # 出品者以外あるいは自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する
  def move_to_index
    return unless current_user.id != @item.user_id || @item.purchase_record.present?

    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
