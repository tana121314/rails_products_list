class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end  

  def create
    @product = Product.new(code:params[:code], name:params[:name], stock_number:params[:stock_number], image_url:params[:image_url], note:params[:note])
    if @product.save
      redirect_to("/")
    else
      # render 'new'
      render action: :new
    end
  end  
end