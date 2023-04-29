class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @item = Item.new()
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
    params.require(:item).permit(:image, :item_name, :description, :price, :condition_id, :category_id, :shipping_fee_bearer_id, :prefecture_id, :shipping_estimate_id).merge(user_id: current_user.id) 
  end

  def authenticate_user!
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
