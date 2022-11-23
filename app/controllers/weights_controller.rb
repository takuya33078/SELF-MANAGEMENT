class WeightsController < ApplicationController
  before_action :weight_params, only: [:create, :update]
  
  def index
    #@weight = Weight.new(weight_params)
    @weight = Weight.where(customer_id: current_customer[:id])
    @weights = Weight.page(params[:page]).reverse_order
    #@weight = current_customer.weights
    logger.debug"------------------------------------@weight---------------------"
    logger.debug(@weight.inspect)
  end
  
  def create
    #logger.debug"---------------------------------------------------------------"
    #logger.debug@params[:weight][:current_weight]
    Weight.create(current_weight: @params[:weight][:current_weight], 
                  customer_id: current_customer[:id])
    
    if @params[:weight][:current_weight].to_i - current_customer[:goal_weight].to_i  <= 0
      flash[:success] = "達成おめでとうございます！"
      redirect_to weights_path
    else
      flash[:success] = "登録しました。"
      redirect_to weights_path
    end
    #@weight = Weight.new(weight_params)
    #logger.debug"---------------------------------------------------------------"
    #logger.debug(@weight.inspect)    
    #@weight.save!
    #logger.debug"---------------------------------------------------------------"
    #logger.debug(@weight.inspect)
  end

  def edit
    @weight = Weight.find(params[:id])
    #logger.debug"---------------------------------------------------------------"
    #logger.debug(@weight.inspect)
  end
  
  def update
    logger.debug"---------------------------------------------------------------"
    logger.debug @params[:weight][:current_weight] 
    @weight = Weight.find(params[:id])
    @weight.update(current_weight: @params[:weight][:current_weight])
    #@weight.update(weight_params)
    #Weight.update(current_weight: @params[:current_weight], id: )
    redirect_to weights_path
  end
  
  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy
    redirect_to weights_path
  end
  
  private
  def weight_params
    @params = params
    #params.permit(:current_weight, :created_at, :updated_at)
    #logger.debug"---------------------------------------------debug------------------"
    #logger.debug @params[:weight][:current_weight]
  end
end
