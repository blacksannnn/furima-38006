class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.includes(:user).order('created_at DESC')
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

  def show
    
  end

  def edit
      unless current_user == @product.user
      redirect_to root_path
      end
  end
  
  def update
        if @product.update(product_params)
          redirect_to product_path
        else
          render :edit
        end
  end

  def destroy
        if @product.destroy
          redirect_to root_path
        end
  end


  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :product_condition_id, :delivery_charge_id,
                                    :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
