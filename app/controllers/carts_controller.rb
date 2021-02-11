class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

    def index
      @carts = Cart.all
      render json: @carts
    end

    def show
      render json: @cart
    end

    def create
      @cart = Cart.new(cart_params)

      if @cart.save
        render json: @cart, status: :created, location: @cart
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end

    def update
      if @cart.update(cart_params)
        render json: @cart
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @cart.destroy if @cart.id == session[:cart_id]
      session[:cart_id] = nil
      render json: { head: :no_content}
    end

    private
      def set_cart
        @cart = Cart.find(params[:id])
      end

      def cart_params
        params.fetch(:cart, {})
      end
      def invalid_cart
        logger.error "Attempt to access invalid cart #{params[:id]}"
      end
end
