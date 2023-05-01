class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :redirect_if_sold, only: [:edit, :update]
  before_action :redirect_unless_owner, only: [:edit, :update]
  def index
    @items = Item.all.order(created_at: :DESC)
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

  def show
    @item = Item.find_by(id: params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def redirect_if_sold
    @item = Item.find(params[:id])
    if PurchaseHistory.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def redirect_unless_owner
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :condition_id, :category_id, :shipping_fee_bearer_id,
                                 :prefecture_id, :shipping_estimate_id).merge(user_id: current_user.id)
  end

end
