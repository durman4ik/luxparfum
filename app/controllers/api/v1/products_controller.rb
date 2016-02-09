class Api::V1::ProductsController < Api::V1::MainController

  def index
    # @products = Hash.recursive
    if params[:options]
      category = params[:options][:category] != 'null' ? Category.find_by(name: params[:options][:category]).id : 
	Category.in(name: Category.all.map(&:name)).map(&:id)
      @products = Product.in(category_ids: category)

      if params[:brand]  != 'null' && params[:brand].present?
        brand = Brand.find_by(name: params[:brand])
        @products = @products.where(brand_id: brand.id)
      end
    else
      @products = Product.all
    end
    render json: @products.to_json(methods: [:images_url], include: :brand), root: false
  end

  def show
    respond_with Product.find(params[:name])
  end
end
