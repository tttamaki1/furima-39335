class PurchaseHistoryController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_history_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_form).permit(:postal_code, :prefecture, :city, :house_number, :building_name,
                                          :price).merge(user_id: current_user.id)
  end
end
