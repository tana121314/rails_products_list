class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_param)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def product_param
    params.require(:product).permit(:code, :name, :stock_number, :image_url, :note)
  end
end
