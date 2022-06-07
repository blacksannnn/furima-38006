class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
      @product = Product.new
  end 

  def crete
      @product = Product.new(prototype_params)
      if @pproduct.save
        redirect_to root_path
      else
        render :new
      end
  end

  def product_params
    params.require(:product).permit(:product_name,:description,:category_id,:product_condition_id,:prefecture_id,:delivery_charge_id,:delivery_charge_id,:delivery_charge_id,:delivery_charge_id,:delivery_charge_id,:price,).merge(user_id: current_user.id)
  end
  
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
