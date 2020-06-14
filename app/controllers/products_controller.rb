class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
    # @search = Product.ransack(params[:q])
    # @products = @search.result
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
  end

  private
  def product_params
    params.require(:product).permit(:code, :name, :stock_number, :image_url, :note)
  end
end
