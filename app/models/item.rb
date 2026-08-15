class Item < ApplicationRecord
  belongs_to :user
  #validates :user_id presence: true ←不要#
end
