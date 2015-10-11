class Categories::ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]

  def show
    @product = Product.friendly.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
  end

  def new
    @category = Category.friendly.find(params[:category_id])
    @product = Product.new
  end

  def create
    @category = Category.friendly.find(params[:category_id])
    @product = @category.products.build(product_params)
    if @product.save
      flash[:notice] = "You just created " + @product.title + "!"
      redirect_to category_path(@category)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @product = Product.friendly.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
  end

  def update
    @product = Product.friendly.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
    if @product.update_attributes(product_params)
      flash[:notice] = "Good job!"
      redirect_to category_product_path(@category, @product)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @product = Product.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def product_params
      params.require(:product).permit(:title, :image, :description, :price, :link)
    end

end
