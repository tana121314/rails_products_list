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

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @product = Product.find_by(code: stock_params[:product_id])
    @stock.product_id = @product.id
    if @stock.save
      redirect_to stocks_path
    else
      render :new
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:product_id, :price, :quantity)
  end
end
