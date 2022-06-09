class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.includes(:user)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :product_condition_id, :delivery_charge_id,
                                    :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
