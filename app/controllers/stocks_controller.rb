class StocksController < ApplicationController
  def index
    @stock = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to stocks_path
    else
      render :new
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:stock_id, :name, :thumbnail, :number, :average_price)
  end
end
