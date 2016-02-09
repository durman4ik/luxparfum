class Admin::Dashboard::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
  end
end