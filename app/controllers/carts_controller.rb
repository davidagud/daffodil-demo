class CartsController < ApplicationController
  before_action :require_user

  def show
    @order = Order.all
    @order_items = current_order.order_items

    wedding_names = []
    @order_items.each do |item| wedding_names.push(item.wedding.wedding_name) end

    respond_to do |format|
      format.html
      format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename = ' + wedding_names.join(' & ') + '.xlsx' }
    end
  end
end
