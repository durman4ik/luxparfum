class Api::V1::OrdersController < ApplicationController
  respond_to :json
  def create
    @order = Order.create(order_params)
    if @order
      OrderMailer.new_order(@order).deliver_now
      render json: {status: 200}
    else
      render json: {status: 500}
    end
  end

  private

  def order_params
    params.require(:order).permit(
        :name,
        :phone,
        :product_name,
        :count,
        :price,
        volume:[:value]      )
  end
end