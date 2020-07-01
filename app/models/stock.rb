class Stock < ApplicationRecord
  validates :product_id, presence: true
  validates :price,      presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity,   presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :product

  # 「単価*在庫数」、平均単価を求める時に使用
  def total
    price.to_i * quantity.to_i
  end
end
