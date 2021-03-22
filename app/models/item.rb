class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :item_name
    validates :item_detail
    validates :item_status_id, numericality: { other_than: 1, message: ' must be selected' }
    validates :category_id, numericality: { other_than: 1, message: ' must be selected'  }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: ' must be inputted between ¥300 and ¥9,999,999' }
    validates :shipping_charge_id, numericality: { other_than: 1, message: ' must be selected'  }
    validates :shipping_day_id, numericality: { other_than: 1, message: ' must be selected'  }
    validates :prefecture_id, numericality: { other_than: 1, message: ' must be selected'  }
    validates :image
  end

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  has_many :comments
  has_one :order
  has_one_attached :image
end
