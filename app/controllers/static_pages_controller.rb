class StaticPagesController < ApplicationController

  def home
    @products = Product.all
  end

  def privacy
  end

  def contact
  end

end
