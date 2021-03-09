class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :height, numericality: {only_integer: greater_than: 1, less_than: 999, message: 'には3桁以内かつ半角数字で入力してください'}
  end
end
