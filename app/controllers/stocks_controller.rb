class StocksController < ApplicationController
  def index
    @product = Product.all
    @stock = Stock.all
    @stock.each do |stock|
      @total = stock.price * stock.quantity
      stock.total = @total
      stock.save
    end
  end

  def new_stock
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to stocks_path
    else
      render :new_stock
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:product_id, :price, :quantity)
  end
end
