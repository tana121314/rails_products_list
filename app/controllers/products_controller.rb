class ProductsController < ApplicationController
  def list
    @products = Product.all
  end
end
