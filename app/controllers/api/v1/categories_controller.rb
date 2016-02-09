class Api::V1::CategoriesController < Api::V1::MainController

  def index
    categories = Category.all
    render json: categories, status: 201, root: false
  end

  def show

  end

end
