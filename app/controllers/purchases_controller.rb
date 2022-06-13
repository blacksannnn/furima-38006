class PurchasesController < ApplicationController
  
  def index
    @purchase_destination = PurchaseDestination.new
    @product = Product.find(params[:product_id])
  end

  def create
    @purchase_destination = PurchaseDestinationnew(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

end
