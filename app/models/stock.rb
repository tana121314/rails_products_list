class Stock < ApplicationRecord
  validates :product_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :product
  def total
    price.to_i * quantity.to_i
  end
end
