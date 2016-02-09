class CategoriesController < ApplicationController
  def show
    @category = Category.includes(:pages).all
  end
end
