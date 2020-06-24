class StocksController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @stock = Stock.new
  end

  def new_stock
    params[:product_id] = params[:stock_id]
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.price.nil? || @stock.quantity.nil?
      @stock.save
      render :new
      return
    end
    @stock[:total] = @stock.total
    if @stock.save
      redirect_to stocks_path
    else
      render :new
    end
  end

  def create_stock
    @stock = Stock.new(stock_params)
    if @stock.price.nil? || @stock.quantity.nil?
      @stock.save
      render :new_stock
      return
    end
    @stock[:total] = @stock.total
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
