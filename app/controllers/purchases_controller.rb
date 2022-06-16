class PurchasesController < ApplicationController
  before_action :set_trace_func, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @purchase_destination = PurchaseDestination.new
    redirect_to root_path if @product.user == current_user || !@product.purchase.nil?
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, token: params[:token], product_id: params[:product_id]
    )
  end

  def set_trace_func
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @product.price, 
      card: purchase_params[:token], 
      currency: 'jpy'                 
    )
  end

end
