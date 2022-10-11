class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    @weights = Weight.all
  end
  
  def create
    @weight = Weight.new(weight_params)
    @weight.save
    #logger.debug"---------------------------------------------------------------"
    #logger.debug(@weight.inspect)
    redirect_to weights_path
  end

  def edit
    @weight = Weight.find(params[:id])
    #logger.debug(@weight.inspect)
  end
  
    def update
    @weight = Weight.find(params[:id])
    @weight.update(weight_params)
    redirect_to weights_path
    end
  
  private
  def weight_params
    params.require(:weight).permit(:current_weight)
  end
end
