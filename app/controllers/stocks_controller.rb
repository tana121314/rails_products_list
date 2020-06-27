class StocksController < ApplicationController
  # 在庫一覧
  def index
    @search = Product.ransack(params[:q])
    @products = @search.result(distinct: true).page(params[:page]).per(8)
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
    # 商品一覧に在庫数を反映させる
    @product = Product.find_by(id: stock_params[:product_id])
    @product.stock_number = @product.stocks.all.sum(:quantity)
    @product.save
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
    # 商品一覧に在庫数を反映させる
    @product = Product.find_by(id: stock_params[:product_id])
    @product.stock_number = @product.stocks.all.sum(:quantity)
    @product.save
  end

  private

  def stock_params
    params.require(:stock).permit(:product_id, :price, :quantity)
  end
end
