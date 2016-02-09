class Admin::Dashboard::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = paginate(Product.all)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      @product.add_images(product_params[:product_images])
      redirect_to admin_dashboard_products_url(subdomain: 'admin')
    else
      render :new
    end
  end

  def update
    @product.assign_attributes(product_params)
    @product.add_images(product_params[:product_images]) if product_params[:product_images].present?
    if @product.save
      redirect_to admin_dashboard_products_url(subdomain: 'admin')
    else
      render :edit
    end
  end

  def destroy
    @product.delete
    redirect_to admin_dashboard_products_url(subdomain: 'admin')
  end

  def import

  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
        :name_en,
        :name_ru,
        :description,
        :title,
        :first_notes,
        :second_notes,
        :third_notes,
        :brand_id,
        :version,
        :year,
        :for_man,
        :slug,
        category_ids: [],
        product_images: [],
        volumes_attributes: [:id, :_destroy, :value, :price, :old_price]
    )
  end
end