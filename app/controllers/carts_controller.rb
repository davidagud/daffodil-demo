class CartsController < ApplicationController
  before_action :require_user

  def show
    @order = Order.all
    @order_items = current_order.order_items

    wedding_dates = []
    @order_items.each do |item| wedding_dates.push(item.wedding.wedding_date) end

    respond_to do |format|
      format.html
      format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename = ' + wedding_dates.sort.first.to_s + '.xlsx' }
    end
  end
end
