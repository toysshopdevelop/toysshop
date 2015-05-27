class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  def index
    @categories = Category.all.page(params[:page]).per(50)
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:title, :parent_id)
  end
end
