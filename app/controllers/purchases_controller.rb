class PurchasesController < ApplicationController
  before_action :set_trace_func, onry: [:index, :create]


  def index
    @purchase_destination = PurchaseDestination.new  
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
  
  def set_trace_func
  @product = Product.find(params[:product_id])
  end


end
