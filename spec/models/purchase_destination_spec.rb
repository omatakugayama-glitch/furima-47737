require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    @purchase_destination = FactoryBot.build(:purchase_destination)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'すべての項目が正しく入力されていれば購入できる' do
        expect(@purchase_destination).to be_valid
      end

      it '建物名が空でも購入できる' do
        @purchase_destination.building = ''
        expect(@purchase_destination).to be_valid
      end

      it '電話番号が10桁でも購入できる' do
        @purchase_destination.phone_number = '0312345678'
        expect(@purchase_destination).to be_valid
      end

      it '電話番号が11桁でも購入できる' do
        @purchase_destination.phone_number = '09012345678'
        expect(@purchase_destination).to be_valid
      end
    end

    context '購入できない場合' do
      it 'user_idが空では購入できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空では購入できない' do
        @purchase_destination.postal_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @purchase_destination.postal_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages)
          .to include('Postal code is invalid')
      end

      it '郵便番号が全角数字では購入できない' do
        @purchase_destination.postal_code = '１２３-４５６７'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages)
          .to include('Postal code is invalid')
      end

      it '都道府県が未選択では購入できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が空では購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @purchase_destination.address = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上では購入できない' do
        @purchase_destination.phone_number = '090123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号にハイフンが含まれていると購入できない' do
        @purchase_destination.phone_number = '090-1234-5678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が全角数字では購入できない' do
        @purchase_destination.phone_number = '０９０１２３４５６７８'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end