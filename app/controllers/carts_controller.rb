class CartsController < ApplicationController
  def show
    @order = Order.all
    @order_items = current_order.order_items
  end
end
