require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe 'ユーザー新規登録' do
    context '商品登録できる場合' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '商品登録できない場合' do
      it '画像が空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では登録できない' do
        @product.product_condition_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product condition can't be blank")
      end

      it '配送料が空では登録できない' do
        @product.delivery_charge_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '発送元の地域が空では登録できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では登録できない' do
        @product.delivery_day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '価格が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '価格は299円以下は登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格は10,000,000円以上は登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 99999999')
      end

      it '価格は半角以外登録できない' do
        @product.price = 'あいう'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '価格は数値以外登録できない' do
        @product.price = 'abc'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
