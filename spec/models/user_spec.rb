require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が完了するとき' do
      it "全ての項目が正しく入力されてあれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "emailに@が含まれていない場合登録できない" do
      @user.email = 'rurukorogmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid? 
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）を入力してください")
      end

      it "passwordが英語のみでは登録できない" do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "passwordが数字のみでは登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "passwordが全角では登録できない" do
        @user.password = 'まついたけお'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字は不正な値です")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
      end

      it "last_nameが半角文字だと登録できない" do
        @user.last_name = "matsui"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end

      it "first_nameが半角文字だと登録できない" do
        @user.first_name = "takeo"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end

      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナを入力してください", "苗字カナは不正な値です")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
      expect(@user.errors.full_messages).to include("名前カナを入力してください", "名前カナは不正な値です")
      end

      it "last_name_kanaが全角ひらがなだと登録できない" do
        @user.last_name_kana = "まつい"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナは不正な値です")
      end

      it "last_name_kanaが半角カタカナだと登録できない" do
        @user.last_name_kana = "ﾏﾂｲ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナは不正な値です")
      end

      it "first_name_kanaが全角ひらがなだと登録できない" do
        @user.first_name_kana = "たけお"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは不正な値です")
      end

      it "first_name_kanaが半角カタカナだと登録できない" do
        @user.first_name_kana = "ﾀｹｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは不正な値です")
      end

      it "birth_dayが空では登録できない" do
        @user.birth_day = ""
        @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end



    end
  end
end