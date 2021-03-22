FactoryBot.define do
  factory :post do
    text {'テスト'}
    tops_shop {'スリフトトーキョー'}
    tops_prefecture {'北海道'}
    tops_brand {'NIKE'}
    tops_price {'19000'}
    pants_shop {'hhh'}
    pants_prefecture_id {2}
    pants_brand {'hhh'}
    pants_price {'190000'}
    shoes_shop {'hhh'}
    shoes_prefecture_id {2}
    shoes_brand {'hhh'}
    shoes_price {'10000'}
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
