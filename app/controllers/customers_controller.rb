class CustomersController < ApplicationController
def show
 @customer = current_customer
end

def edit
 @customer = current_customer
end

def update
  @customer = current_customer
  if @customer.update!(customer_params)
  flash[:success] = "登録情報を変更しました。"
  redirect_to customers_my_page_path
  else
  render 'edit'
  end
end

def unsubcribe
  @customer = current_customer
end

def withdrawal
   @customer = current_customer
   if @customer.update!(is_deleted: true)
      sign_out current_customer
   end
   redirect_to root_path
end

private
 def customer_params
 params.permit(:name, :email, :goal_weight)
 end
end
