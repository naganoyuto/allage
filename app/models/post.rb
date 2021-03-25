class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture 
  belongs_to :user 
  has_one_attached :image
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :likes, dependent: :destroy
  with_options presence: true do
    validates :tops_shop
    validates :tops_prefecture
    validates :tops_brand
    validates :tops_price
    validates :pants_shop
    validates :pants_brand
    validates :shoes_shop
    validates :shoes_brand
    validates :image
    with_options numericality: true do
      validates :pants_price
      validates :shoes_price
    end
    with_options numericality: { other_than: 1 } do
      validates :pants_prefecture_id
      validates :shoes_prefecture_id
    end
  end
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end
end


def liked_by?(user)
  likes.where(user_id: user.id).exists?
end