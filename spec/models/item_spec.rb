require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end

  describe '商品新規投稿' do
    context '商品新規投稿ができるとき' do
      it 'image,name,explanation,category_id,condition_id,shipping_fee_id,ship_from_id,shipping_days_id,priceが存在すれば投稿できる' do
        expect(@item).to be_valid
      end
      it 'priceが300以上9999999以下であれば投稿できる' do
        @item.price = 301
        expect(@item).to be_valid
      end
    end

    context '商品投稿ができないとき' do
      it 'imageが空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'nameが空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explanationが空では投稿できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが空では投稿できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'condition_idが空では投稿できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'shipping_fee_idが空では投稿できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'ship_from_idが空では投稿できない' do
        @item.ship_from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'shipping_days_idが空では投稿できない' do
        @item.shipping_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'categoryが---では投稿できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーが不正な値です")
      end
      it 'conditionが---では投稿できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態が不正な値です")
      end
      it 'shipping_feeが---では投稿できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担が不正な値です")
      end
      it 'ship_fromが---では投稿できない' do
        @item.ship_from_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域が不正な値です")
      end
      it 'shipping_daysが---では投稿できない' do
        @item.shipping_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数が不正な値です")
      end
      it 'nameが41字以上では投稿できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it 'explanationが1001字以上では投稿できない' do
        @item.explanation = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
      end
      it 'priceが空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceに半角数字以外を含むと投稿できない' do
        @item.price = '300A'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it 'priceが299以下では投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it 'priceが10000000以上では投稿できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
