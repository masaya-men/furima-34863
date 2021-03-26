class Address < ApplicationRecord
  # 実装完了までのこす=================
  # with_options presence: true do
  #   validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
  #   validates :prefecture_id
  #   validates :municipality
  #   validates :phone_number, format: {with: /\A\d{10,11}\z/}, length: {in: 1..11}
  #   validates :order_id
  #   validates :building, allow_nil: true
  # end
# 実装完了まで残す=====================

  belongs_to :order

end
