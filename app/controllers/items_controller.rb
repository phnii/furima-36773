class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private 

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_id, :ship_from_id, :shipping_days, :price, :image).merge(user_id: current_user.id)
  end
end
