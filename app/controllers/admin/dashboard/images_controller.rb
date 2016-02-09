class Admin::Dashboard::ImagesController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    image = Image.find(params[:id])
    if image.destroy
      respond_to :js
    end
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
