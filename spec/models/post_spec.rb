require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'コーデの投稿' do
    context 'コーデの投稿ができる場合' do
      it 'すべての入力が正しければ投稿できる' do
        expect(@post).to be_valid
      end
    end

    context 'コーデの投稿ができない場合' do
      it '画像が空では投稿できない' do
       @post.image = nil
       @post.valid?
       expect(@post.errors.full_messages).to include("Image can't be blank")
      end

      it '各商品の購入先が空では投稿できない' do
        @post.tops_shop = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Tops shop can't be blank")
      end
  
      it '各商品の購入先エリアが空では投稿できない' do
        @post.tops_prefecture = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Tops prefecture can't be blank")
      end

      it '各商品のブランドが空では投稿できない' do
        @post.tops_brand = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Tops brand can't be blank")
      end  

      it '各商品の価格が空では投稿できない' do
        @post.tops_price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Tops price can't be blank")
      end

      it 'ボトムスの購入先店舗が空では投稿できない' do
        @post.pants_shop = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Pants shop can't be blank")
      end

      it 'ボトムスの購入先エリアが1では投稿できない' do
        @post.pants_prefecture_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Pants prefecture must be other than 1")
      end

      it 'ボトムスのブランドが空では投稿できない' do
        @post.pants_brand = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Pants brand can't be blank")
      end

      it 'ボトムスの価格が空では投稿できない' do
        @post.pants_price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Pants price can't be blank")
      end

      it 'シューズの購入店舗先が空では投稿できない' do
        @post.shoes_shop= ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Shoes shop can't be blank")
      end

      it 'シューズの購入店舗先エリアが1では投稿できない' do
        @post.shoes_prefecture_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Shoes prefecture must be other than 1")
      end

      it 'シューズのブランドが空では投稿できない' do
        @post.shoes_brand= ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Shoes brand can't be blank")
      end

      it 'シューズの価格が空では投稿できない' do
        @post.shoes_price= ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Shoes price can't be blank")
      end

    end
  end
end
