FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password {'nagano4030'}
    password_confirmation { password }
    nickname {'シンゴり。'}
    height {170}
  end
end 