class WeightsController < ApplicationController
  before_action :weight_params, only: [:create, :update]
  
  def index
    #@weight = Weight.new(weight_params)
    #@weights = Weight.where(id: params[:id])
    @weights = Weight.all
    #logger.debug"---------------------------------------------------------------"
    #logger.debug(@weights.inspect)
  end
  
  def create
    #logger.debug"---------------------------------------------------------------"
    #logger.debug@params[:current_weight]       
    Weight.create(current_weight: @params[:current_weight])
    #@weight = Weight.new(weight_params)
    #logger.debug"---------------------------------------------------------------"
    #logger.debug(@weight.inspect)    
    #@weight.save!
    #logger.debug"---------------------------------------------------------------"
    #logger.debug(@weight.inspect)
    redirect_to weights_path
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
  
  private
  def weight_params
    @params = params
    #params.permit(:current_weight, :created_at, :updated_at)
    #logger.debug"---------------------------------------------debug------------------"
    #logger.debug @params[:weight][:current_weight]
  end
end
