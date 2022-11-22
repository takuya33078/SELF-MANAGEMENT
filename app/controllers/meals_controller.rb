class MealsController < ApplicationController
  def index
    @meals = Meal.all.page(params[:page]).reverse_order
    @meal = Meal.find_by(customer_id: params[:customer_id])
  end

  def new
     @meal = Meal.new
  end
  
  def create
     @meal = Meal.new(meal_params)
     #@meal.customer_id = current_customer.id　
     logger.debug"----------------------------------------------------------------"
     logger.debug(@meal.inspect)
    if @meal.save!
        redirect_to meals_path
    else
        flash[:meal_created_error] = "食事情報が正常に保存されませんでした。"
        redirect_to new_meal_path
    end
  end

  def edit
     @meal = Meal.find(params[:id])
  end
  
private
  def meal_params
    params.require(:meal).permit(:customer_id, :image, :dish_name, :created_at, :updated_at)
  end
end
