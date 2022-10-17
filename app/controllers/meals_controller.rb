class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def new
     @meal = Meal.new
  end
  
  def create
     @meal = Meal.new(meal_params)
     logger.debug"----------------------------------------------------------------"
     logger.debug(@meal.inspect)
    if @meal.save!
        redirect_to meals_path
    else
        flash[:meal_created_error] = "商品情報が正常に保存されませんでした。"
        redirect_to new_meal_path
    end
  end

  def edit
     @meal = Meal.find(params[:id])
  end
  
private
  def meal_params
    params.require(:meal).permit(:image, :dish_name, :created_at, :updated_at)
  end
end
