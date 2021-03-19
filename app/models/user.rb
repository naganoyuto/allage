class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes
  with_options presence: true do
    validates :nickname
    validates :height, numericality: { only_integer: true, greater_than: 1, less_than: 999, message: 'には３桁以内の半角数字でお願いします' }
  end
end
