require 'rails_helper'

RSpec.describe Donation, type: :model do
  before do
    @donation = FactoryBot.build(:donation)
    @donation.image = fixture_file_upload('app/assets/images/icon_take.png')
  end

  describe 'たけラボクラファ出品機能' do
    context '出品がうまくいくとき' do

      it 'image/donation_name/description/price/user_idが存在すれば登録できる' do
        expect(@donation).to be_valid
      end

      it "priceが1000だと登録できる" do
        @donation.price = 1000
        @donation.valid?
        expect(@donation.price).to eq be_valid
      end

      it "priceが100000だと登録できる" do
        @donation.price = 100000
        @donation.valid?
        expect(@donation.price).to eq be_valid
      end

    end

    context '商品出品がうまくいかないとき' do

      it 'imageが空だと登録できない' do
        @donation.image = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("画像を入力してください")
      end

      it 'donation_nameが空だと登録できない' do
        @donation.donation_name = ''
        @donation.valid?
        expect(@donation.errors.full_messages).to include("クラウドファンディングネームを入力してください")
      end

      it 'descriptionが空だと登録できない' do
        @donation.description = ''
        @donation.valid?
        expect(@donation.errors.full_messages).to include("説明を入力してください")
      end

      it 'priceが空では登録されない' do
        @donation.price = ''
        @donation.valid?
        expect(@donation.errors.full_messages).to include("販売価格を入力してください")
      end

      it 'priceが999以下だと登録できない' do
        @donation.price = 999
        @donation.valid?
        expect(@donation.errors.full_messages).to include("販売価格は999より大きい値にしてください")
      end

      it 'priceが100001以上だと登録できない' do
        @donation.price = 100001
        @donation.valid?
        expect(@donation.errors.full_messages).to include("販売価格は100001より小さい値にしてください")
      end

      it 'priceが半角数字以外では登録できない' do
        @donation.price = "１０００"
        @donation.valid?
        expect(@donation.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it 'priceが半角英数字混合では登録できない' do
        @donation.price = "10ad"
        @donation.valid?
        expect(@donation.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it 'priceが半角英字のみでは登録できない' do
        @donation.price = "takeo"
        @donation.valid?
        expect(@donation.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      
    end
  end
end
