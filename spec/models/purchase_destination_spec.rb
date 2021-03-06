require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  
  before do
     user = FactoryBot.create(:user)
     product = FactoryBot.create(:product)
     @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, product_id: product.id)
  end

  describe '購入送付先の保存' do
    context '商品購入できる場合' do
      it '全ての項目が入力されていれば購入できること' do
        expect(@purchase_destination).to be_valid
      end

      it '建物名が空でも購入できる' do
        @purchase_destination.building_name = ''
        expect(@purchase_destination).to be_valid
      end
    end

    context '商品購入できない場合' do
      it '郵便番号が正しく入力されていないと購入できない' do
        @purchase_destination.post_code = '123-123'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Post code is invalid')
      end

      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @purchase_destination.post_code = '1231234'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Post code is invalid')
      end

      it '郵便番号が空だと購入できない' do
        @purchase_destination.post_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Post code is invalid')
      end

      it '都道府県が空だと購入できない' do
        @purchase_destination.prefecture_id = '1'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できない' do
        @purchase_destination.address = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が10桁以上でないと購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が11桁以内でないと購入できない' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が半角でないと購入できない' do
        @purchase_destination.phone_number = 'あいう'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end

      
      it 'userが紐付いていないと保存できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐付いていないと保存できない' do
        @purchase_destination.product_id= nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Product can't be blank")
      end

    end
  end
end
