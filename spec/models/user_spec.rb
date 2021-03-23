require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての値を正しく入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
  context '新規登録できないとき' do
    it 'imageが空では登録できない' do
      @user.image = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Image can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'heightが空らでは登録できない' do
      @user.height = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Height can't be blank")
    end
    it 'heightが4桁以上では登録できない' do
      @user.height = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Height には３桁以内の半角数字でお願いします")
    end

    it 'heightが英文字では登録できない' do
      @user.height = 'hundred'
      @user.valid?
      expect(@user.errors.full_messages).to include("Height には３桁以内の半角数字でお願いします")
    end

    it 'heightが全角数字では登録できない' do
      @user.height = '１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Height には３桁以内の半角数字でお願いします")
    end
    
    
  end
end
