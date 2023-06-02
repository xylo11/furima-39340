class PurchasesController < ApplicationController

  def index
    @purchase_shipping = PurchaseShipping.new
  end
end