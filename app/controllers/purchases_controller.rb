class PurchasesController < ApplicationController
  
  def index
    @destinations_purchases = DestinationsPurchases.new
  end

  def create
  end

end
