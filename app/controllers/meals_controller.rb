class MealsController < ApplicationController
  before_action :meal_params, only: [:create, :update]
  def index
    @meals = Meal.all.page(params[:page]).reverse_order
    @meal = Meal.where(customer_id: current_customer[:id])
  end

  def new
    @meal = Meal.new
  end
  
  def create
    logger.debug"---------------------------------------------debug------------------"
    logger.debug params[:image_id]
    @meal = Meal.create(dish_name: params[:meal][:dish_name], 
                  customer_id: current_customer[:id])
    #@meal.customer_id = current_customer.id

    logger.debug"----------------------create------------------------------------------"
    logger.debug(@meal.inspect)
    if @meal.save
      redirect_to meals_path
    else
      flash[:meal_created_error] = "食事情報が正常に保存されませんでした。"
      redirect_to new_meal_path
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end  


  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    logger.debug"-----------------update-----------------------------------------------"
    logger.debug(@meal.inspect)
    @meal = Meal.find(params[:id])
    @meal.update(dish_name: params[:meal][:dish_name])
    #@weight.update(weight_params)
    #Weight.update(current_weight: @params[:current_weight], id: )
    redirect_to weights_path
  end
  
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path
  end
  
private
  def meal_params
    params.require(:meal).permit(:customer_id, :image, :dish_name, :created_at, :updated_at)
  end
end
