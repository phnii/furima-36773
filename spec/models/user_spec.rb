require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが数字と英字の両方含み6文字以上であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)を入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前全角文字を使用してください')
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字全角文字を使用してください')
      end
      it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(カナ)全角カナ文字を使用してください')
      end
      it 'last_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)全角カナ文字を使用してください')
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'ABCtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードは全角文字を含む場合登録できない' do
        @user.password = '123ABCあ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        another_user = FactoryBot.create(:user)
        another_user.email = 'another@another'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが5字以下では登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
    end
  end
end
