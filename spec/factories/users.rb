FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 5) + 'a1' }
    password_confirmation { password }
    last_name             {'松井'}
    first_name            {'丈夫'}
    last_name_kana        {'マツイ'}
    first_name_kana       {'タケオ'}
    birth_day             {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end