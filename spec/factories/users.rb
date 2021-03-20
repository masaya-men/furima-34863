FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {'aaa999'}
    password_confirmation {password}
    last_name             {'太ろウ'}
    first_name            {'ヤま田'}
    last_furigana         {'タロウ'}
    first_furigana        {'ヤマダ'}
    birthday              {'2222-12-12'}
  end
end


# 正規表現を試そうとした
    # /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i