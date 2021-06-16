require 'rails_helper'

RSpec.describe DonationOrder, type: :model do

  describe 'たけラボクラファ購入機能' do

    before do
      @user = FactoryBot.create(:user)
      @donation = FactoryBot.create(:donation)
      sleep(0.5)
      @donation_order = FactoryBot.build(:donation_order, user_id: @user.id, donation_id: @donation.id)
      
    end


    context '商品購入がうまくいくとき' do

      it '全ての項目が入力されていれば購入ができる' do
        expect(@donation_order).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @donation_order.building_name = nil
        @donation_order.valid?
        expect(@donation_order.building_name).to eq nil
      end

    end

    context '商品購入がうまくいかないとき' do

      it "tokenが空では登録できないこと" do
        @donation_order.token = nil
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it '郵便番号が空だと購入ができない' do
        @donation_order.postal_code = nil
        @donation_order.valid?
        expect(@donation_order.errors.messages).to include({:postal_code => ["を入力してください", "は不正な値です" ]})
      end

      it '郵便番号に"-"がないと登録できない' do
        @donation_order.postal_code = "12345678"
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it '郵便番号が8桁でないと購入できない' do
        @donation_order.postal_code = "123-458"
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it 'shipping_area_idが空だと購入できない' do
        @donation_order.shipping_area_id = nil
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'shipping_area_idが1だと登録できない' do
        @donation_order.shipping_area_id = 1
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end

      it 'city_nameが空だと購入できない' do
        @donation_order.city_name = ""
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'block_nameが空だと購入できない' do
        @donation_order.block_name = ""
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空だと購入できない' do
        @donation_order.phone_number = nil
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("携帯番号を入力してください", "携帯番号は不正な値です")
      end

      it 'phone_numberが11桁でなければ購入できない' do
        @donation_order.phone_number = "080123456789"
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("携帯番号は不正な値です")
      end

      it 'phone_numberに"-"が含まれていると登録できない' do
        @donation_order.phone_number = '090-1234-5678'
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include('携帯番号は不正な値です')
      end

      it 'phone_numberが全角数字だと登録できない' do
        @donation_order.phone_number = '０９０１２３４５６７８'
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include('携帯番号は不正な値です')
      end

      it 'user_idが存在しないと登録できない' do
        @donation_order.user_id = nil
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("Userを入力してください")
      end

      it 'donation_idが存在しないと登録できない' do
        @donation_order.donation_id = nil
        @donation_order.valid?
        expect(@donation_order.errors.full_messages).to include("Donationを入力してください")
      end

    end
  end
end

