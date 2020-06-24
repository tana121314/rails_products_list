class ProductsController < ApplicationController
  def index
    params[:q][:stock_number_gteq] = '' if params[:stock_number].to_i == 1
    params[:q][:stock_number_gteq] = 1  if params[:stock_number].to_i == 2
    params[:q][:stock_number_eq] = 0 if params[:stock_number].to_i == 3
    @search = Product.ransack(params[:q])
    @products = @search.result(distinct: true).page(params[:page]).per(8)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
    # stocksテーブルに在庫データを追加
    # price quantity product_idに値を入れる
    @stock = Stock.new({:price => params[:stock][:price], :quantity => product_params[:stock_number], :product_id => @product[:id]})
    # totalに値を代入
    @stock[:total] = @stock.total
    @stock.save
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to products_path
  end

  def destroy_all
    @product = Product.where(id: params[:id])
    @product.destroy_all
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:code, :name, :stock_number, :image_url, :note)
  end
end
