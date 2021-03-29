class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :item_name
    validates :item_detail
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: ' must be inputted between ¥300 and ¥9,999,999' }
  end
  
  with_options presence: true, numericality: { other_than: 1, message: ' must be selected' } do
    validates :status_id
    validates :category_id
    validates :shipping_charge_id
    validates :shipping_day_id
    validates :prefecture_id
  end

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  has_many :comments, dependent: :destroy
  has_one :order
  has_one_attached :image
end
