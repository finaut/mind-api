class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  include CurrentCart
  before_action :set_cart, [:create]
  before_action :set_order, [:show, :update, :destroy ]

  def index
    @orders = Order.all

    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart @cart
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      render json: @order, status: :created, location: @order
    else
      @cart = current_cart
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
