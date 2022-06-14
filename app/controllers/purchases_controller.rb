class PurchasesController < ApplicationController
  before_action :set_trace_func, only: [:index, :create]


  def index
    @purchase_destination = PurchaseDestination.new  
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
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], product_id: params[:product_id] )
  end
  
  def set_trace_func
  @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_4fa0b73deabee2694f6f9726"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @product.price, # 商品の値段
        card: purchase_params[:token],   # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end
