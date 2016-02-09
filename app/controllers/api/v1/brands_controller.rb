class Api::V1::BrandsController < Api::V1::MainController

  def index
    brands = Brand.all
    render json: brands.to_json(only: [:name, :description, :slug],
                                include: {
                                    products:{
                                        only: [:name_en, :description, :price, :slug],
                                        methods: [:images_url]
                                    }
                                }), status: 201, root: false
  end

  def show
    brand = Brand.find_by(name: params[:name])
    render json: Product.where(brand_id: brand.id).to_json(only: [:name_en, :price, :slug], methods: [:images_url])
  end
end
