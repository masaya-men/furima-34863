require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'pssswordは6文字以上かつ半角英数混合でなくては登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationは一致してなくてはならない' do
        @user.password = 'aaa888'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_furiganaは全角カタカナでないと登録できない' do
        @user.last_furigana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana is invalid")
      end
      it 'first_furiganaは全角カタカナでないと登録できない' do
        @user.first_furigana = "あああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana is invalid")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    context 'ユーザーが新規登録できるとき' do
      it '全ての情報が正しく入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上なら新規登録できる' do
        @user.password = "test00"
        @user.password_confirmation = "test00"
        expect(@user).to be_valid
      end
    end

  end
end
