require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    sleep 0.1
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
  end

  context 'ユーザーが商品を購入できるとき' do
    it '全ての情報が正しく入力されていれば購入できる' do
      expect(@order_address).to be_valid
    end
  end

  context 'ユーザーが商品を購入できないとき' do
    it 'tokenが空では購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が無いと購入できない' do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end
    it '都道府県が無いと購入できない' do
      @order_address.prefecture_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が無いと購入できない' do
      @order_address.municipality = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が無いと購入できない' do
      @order_address.address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が無いと購入できない' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid", "Phone number is too short (minimum is 1 character)")
    end
    it '郵便番号にハイフンが無いと購入できない' do
      @order_address.postal_code = "1111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it '電話番号は11桁以内出ないと購入できない' do
      @order_address.phone_number = "000000000001"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid", "Phone number is too long (maximum is 11 characters)")
    end
    it '電話番号が数字のみでないと登録できないこと' do
      @order_address.phone_number = "a0000000000"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号にハイフンが含まれていると登録できないこと' do
      @order_address.phone_number = "000-00000000"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid", "Phone number is too long (maximum is 11 characters)")
    end
    it '電話番号に全角数字を使用していると登録できないこと' do
      @order_address.phone_number = "０００００００００００"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '都道府県がid：１以外でないと登録できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture  must be selected")
    end
    it 'user_idが空では登録できないこと' do
      @order_address.user_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できないこと' do
      @order_address.item_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
