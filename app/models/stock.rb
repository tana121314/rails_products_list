class Stock < ApplicationRecord
  validates :stock_id, presence: true, numericality: { only_integer: true }, uniqueness: true
  validates :name, presence: true
  validates :thumbnail, length: { minimum: 0 }
  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :average_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
