class CheckItem < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :price_min, numericality: { only_integer: true }
  validates :price_max, numericality: { only_integer: true }
end
