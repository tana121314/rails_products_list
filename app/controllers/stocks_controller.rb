class StocksController < ApplicationController
  # 在庫一覧
  def index
    @products = Product.all
  end

  # 新規追加フォーム（プルダウンで商品選択）
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock[:total] = @stock.total
    if @stock.save
      redirect_to stocks_path
    else
      render :new
    end
  end

  # 新規追加フォーム（一覧から直接選択）
  def new_stock
    @stock = Stock.new
  end

  def create_stock
    @stock = Stock.new(stock_params)
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
