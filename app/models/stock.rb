class Stock < ApplicationRecord
  validates :product_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :product
  def total
    price * quantity
  end
  # def add_stock
  #   @stock = Stock.new({:price => params[:stock][:price], :quantity => product_params[:stock_number], :product_id => @product[:id]})
  #   @stock[:total] = @stock.total
  #   @stock.save
  # end
end
