class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  with_options presence: true do
    validates :tops_shop
    validates :tops_prefecture
    validates :tops_brand
    validates :tops_price
    validates :pants_shop
    validates :pants_prefecture_id
    validates :pants_brand
    validates :pants_price
    validates :shoes_shop
    validates :shoes_prefecture_id
    validates :shoes_brand
    validates :image
  end
end
