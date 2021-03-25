class Order < ApplicationRecord
    # 実装完了までのこす=================
  # with_options presence: true do
  #   validates :user_id
  #   validates :item_id
  # end
    # 実装完了までのこす=================


  belongs_to :user
  belongs_to :item
  has_one :address
end
