class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_day

  validates :category_id, :condition_id, :prefecture_id,
            :shipping_fee_id, :shipping_day_id,
            numericality: { other_than: 1 }
    #validates :user_id presence: true ←不要#
end
