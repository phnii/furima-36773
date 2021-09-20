class PurchasesController < ApplicationController
before_action :authenticate_user!
before_action :go_to_top

  def new
    @purchase_address = PurchaseAddress.new
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def go_to_top
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id || Purchase.exists?(item_id: item.id)
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
