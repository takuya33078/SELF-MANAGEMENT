class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
      customer.goal_weight = 50
    end
    sign_in customer
    flash[:success] = "ゲストユーザーとしてログインしました。"
    redirect_to customers_my_page_path
    
  end

  protected

  def configure_permitted_parameters
      added_attrs = [ :name, :email, :password, :password_confirmation, :goal_weight ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end
end
