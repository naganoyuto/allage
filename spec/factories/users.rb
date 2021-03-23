FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password {'nagano4030'}
    password_confirmation { password }
    nickname {'シンゴり。'}
    height {170}

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end 