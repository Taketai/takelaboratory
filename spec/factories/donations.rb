FactoryBot.define do
  factory :donation do
    
    donation_name           { '森のようちえん' }
    description            { 'みんなで自然の中で楽しく遊びましょう' }
    price                  { 10000 }
    association :user

    after(:build) do |donation|
      donation.image.attach(io: File.open('app/assets/images/icon_take.png'), filename: 'icon_take.png')
    end
  end
end
