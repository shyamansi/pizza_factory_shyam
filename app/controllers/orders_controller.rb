class OrdersController < ApplicationController
    def index
    orders = Order.all
    render json: orders, status: :ok
  end

  def create
  	Rails.logger.error "Received order params"
   order = OrderService.create_order(order_params)
   render json: {message: "Order Placed Succesfully", order_id: order.id}, status: :created
   rescue StandardError => e
   	render json:{error: e.message} , status: :unprocessable_entity
   end
  private
  def order_params
  params.require(:order).permit(items: [:type ,:id ,:size ,:crust_id ,:extra_cheese ,topping_ids:[]])
  end
end