class MealsController < ApplicationController
  before_action :meal_params, only: [:create, :update]
  def index
    @meal = Meal.where(customer_id: current_customer[:id])
    #logger.debug"---------------------------------------------index------------------"
    #logger.debug id: current_customer[:id]
    @meals = Meal.page(params[:page]).reverse_order
  end

  def new
    @meal = Meal.new
  end
  
  def create
    #logger.debug"---------------------------------------------create------------------"
    #logger.debug params[:meal][:comment]
    @meal = Meal.create(dish_name: params[:meal][:dish_name], 
                        customer_id: current_customer[:id],
                        comment: params[:meal][:comment])
    #@meal.customer_id = current_customer.id

    #logger.debug"----------------------create2------------------------------------------"
    #logger.debug(@meal.inspect)
    if @meal.save
      flash[:success] = "食事情報を登録しました。"
      redirect_to meals_path
    else
      redirect_to new_meal_path
    end
  end

  def show
    @meal = Meal.find_by(id: params[:id])
    #logger.debug"-----------------show-----------------------------------------------"
    #logger.debug(id: params[:id]) 
  end  


  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    #logger.debug"-----------------update-----------------------------------------------"
    #logger.debug(@meal.inspect)
    @meal = Meal.find(params[:id])
    @meal.update(dish_name: params[:meal][:dish_name], 
                 customer_id: current_customer[:id],
                 comment: params[:meal][:comment])
    if @meal.save
      flash[:success] = "食事情報を更新しました。"
      redirect_to meals_path
    else
      redirect_to new_meal_path
    end
    #@weight.update(meal_params)
    #Weight.update(current_weight: @params[:current_weight], id: )
  end
  
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    if @meal.destroy
      flash[:success] = "選択した食事情報を削除しました。"
      redirect_to meals_path
    else
      render new
    end
  end
  
private
  def meal_params
    params.require(:meal).permit(:customer_id, :comment, :dish_name, :created_at, :updated_at)
  end
end
