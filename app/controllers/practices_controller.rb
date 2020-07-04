class PracticesController < ApplicationController
  def index
    @title = params[:title]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
