class CustomersController < ApplicationController
def show
 #logger.debug"-----------------show-----------------------------------------------"
 #logger.debug current_customer[:id]  
 @customer = Customer.find_by(id: current_customer.id)
 #logger.debug"---------------------------------------------------------------"
 #logger.debug @customer.inspect
end

def edit
 @customer = Customer.find_by(id: current_customer.id)
end

def update
  @customer = Customer.find_by(id: current_customer.id)
 #logger.debug"---------------------------------------------------------------"
 #logger.debug customer_params
  if @customer.email == 'guest@example.com' 
    flash[:success] = "ゲストユーザーの情報変更はできません。"
    redirect_to edit_customer_path
  else
    @customer.update(name: params[:customer][:name],
                     email: params[:customer][:email],
                     goal_weight: params[:customer][:goal_weight])
    @customer.save
    flash[:success] = "登録情報を変更しました。"
    redirect_to customers_my_page_path
  end
 logger.debug"---------------------------------------------------------------"
 logger.debug  customer_params
end


def unsubcribe
  @customer = current_customer
end

def withdraw
   @customer = current_customer
   if @customer.email == 'guest@example.com' 
     flash[:success] = "ゲストユーザーの削除はできません。"
     redirect_to customers_my_page_path
   else 
      flash[:success] = "退会しました。"
      sign_out current_customer
   end
end
  
private
 def customer_params
 params.require(:customer).permit(:name, :email, :goal_weight)
 end
end
