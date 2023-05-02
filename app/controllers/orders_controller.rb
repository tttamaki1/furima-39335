class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:new, :create]

  def new
    @order_form = OrderForm.new()
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    binding.pry
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :phone_number,:street_address, :building_name).merge(user_id: current_user.id, item_id: @item.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

end
