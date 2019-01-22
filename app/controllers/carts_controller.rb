class CartsController < ApplicationController
  def show
    @order = Order.all
    @order_items = current_order.order_items

    respond_to do |format|
      format.html
      format.xlsx
    end
  end
end
