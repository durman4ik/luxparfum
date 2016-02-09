class Admin::Dashboard::BrandsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = paginate(Brand.all)
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)
    create_slug(@brand, @brand.name)
    if @brand.save
      redirect_to admin_dashboard_brands_url(subdomain: 'admin')
    else
      render :new
    end
  end

  def update
    create_slug(@brand, brand_params[:name])
    if @brand.update(brand_params)
      redirect_to admin_dashboard_brands_url(subdomain: 'admin')
    else
      render :edit
    end
  end

  def destroy
    @brand.delete
    admin_dashboard_brands_url(subdomain: 'admin')
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :image, product_ids: [])
  end
end