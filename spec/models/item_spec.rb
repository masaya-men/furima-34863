require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規出品' do
    context 'ユーザーが新規出品できる時' do
      it '全ての情報が正しく入力されていれば新規出品できる' do
        expect(@item).to be_valid
      end
    end

    context 'ユーザが新規出品できない時' do
      it '商品画像が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.item_detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it 'カテゴリーが選択されていないと出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category  must be selected")
      end
      it 'カテゴリーは無選択状態(id:1)では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category  must be selected")
      end
      it '商品の状態が選択されていないと出品できない' do
        @item.item_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status  must be selected")
      end
      it '商品の状態は無選択状態(id:1)では出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status  must be selected")
      end
      it '配送料負担について選択されていないと出品できない' do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank", "Shipping charge  must be selected")
      end
      it '配送料負担は無選択状態(id:1)では出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge  must be selected")
      end
      it '発送元地域について選択されていないと出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture  must be selected")
      end
      it '発送元地域は無選択状態(id:1)では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture  must be selected")
      end
      it '発送までの日数が選択されていないと出品できない' do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day  must be selected")
      end
      it '発送までの日数は無選択状態(id:1)では出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day  must be selected")
      end
      it '価格が入力されていないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price  must be inputted between ¥300 and ¥9,999,999")
      end
      it '価格は¥300~¥9,999,999までで半角数字でなければ出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  must be inputted between ¥300 and ¥9,999,999")
      end
      it '価格は全角文字では出品できない' do
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  must be inputted between ¥300 and ¥9,999,999")
      end
      it '半角英数混合では出品できない' do
        @item.price = "333aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  must be inputted between ¥300 and ¥9,999,999")
      end
      it '半角英字だけでは出品できない' do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  must be inputted between ¥300 and ¥9,999,999")
      end
      it '¥10,000,000以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  must be inputted between ¥300 and ¥9,999,999")
      end
    end
  end
end
