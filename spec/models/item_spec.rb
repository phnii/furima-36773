require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では投稿できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では投稿できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では投稿できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では投稿できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_idが空では投稿できない' do
        @item.shipping_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'ship_from_idが空では投稿できない' do
        @item.ship_from_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from can't be blank")
      end
      it 'shipping_days_idが空では投稿できない' do
        @item.shipping_days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      it 'priceが空では投稿できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'nameが41字以上では投稿できない' do
        @item.name = "a"*41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'explanationが1001字以上では投稿できない' do
        @item.explanation = "a"*1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it 'priceが299以下では投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上では投稿できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
