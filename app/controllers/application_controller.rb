class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def redirect_if_sold
    @item = Item.find(params[:id])
    return unless PurchaseHistory.exists?(item_id: @item.id)

    redirect_to root_path
  end

  def redirect_unless_owner
    return if current_user == @item.user

    redirect_to root_path
  end

  def redirect_if_owner
    return if current_user != @item.user

    redirect_to root_path
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date])
  end
end
