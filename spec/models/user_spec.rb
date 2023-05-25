require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '登録に関わる全ての項目を満たせば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname を入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_name が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '789123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'abc123gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'あいうアイウ'
        @user.password_confirmation = 'あいうアイウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'family_nameが半角文字が含まれている場合は登録できない' do
        @user.family_name = 'yama田1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'first_nameが半角文字が含まれている場合は登録できない' do
        @user.first_name_kana = 'ta郎1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角（カタカナ）で入力してください')
      end
      it 'family_name_kanaがカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
        @user.family_name_kana = 'やま田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana は全角（カタカナ）で入力してください')
      end
      it 'family_name_kanaがカタカナ以外の文字（半角英数字）が含まれている場合は登録できない' do
        @user.family_name_kana = 'ヤmada1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana は全角（カタカナ）で入力してください')
      end
      it 'first_name_kanaがカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
        @user.first_name_kana = 'た郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角（カタカナ）で入力してください')
      end
      it 'first_name_kanaがカタカナ以外の文字（半角英数字）が含まれている場合は登録できない' do
        @user.first_name_kana = 'タrou1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角（カタカナ）で入力してください')
      end
    end
  end
end
