class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    @weights = Weight.all
  end
  
  def create
    @weight = Weight.new(weight_params)
    @weight.save
    redirect_to weights_path
  end

  def edit
    @weight = Weight.find(params[:id])
  end
  
    def update
    @weight = Weight.find(params[:id])
    @weight.update(weight_params)
    redirect_to weights_path
    end
  
  private
  def weight_params
    params.require(:weight).permit(:name, :goal_weight, :current_weight)
  end
end
