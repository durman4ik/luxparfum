class Admin::Dashboard::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @categories = paginate(Category.all)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_dashboard_categories_url(subdomain: 'admin')
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_dashboard_categories_url(subdomain: 'admin')
    else
      render :new
    end
  end

  def destroy
    @category.delete
    redirect_to admin_dashboard_categories_url(subdomain: 'admin')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, product_ids: [])
  end
end