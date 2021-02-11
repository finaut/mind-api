class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :update, :destroy]

  def index
    @line_items = LineItem.all

    render json: @line_items
  end

  def show
    render json: @line_item
  end

  def create
    book = Book.find(params[:book_id])
    @line_item = @cart.add_book(book.id)

    if @line_item.save
      render json: @line_item, status: :created, location: @line_item
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @line_item.update(line_item_params)
      render json: @line_item
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item.destroy
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:book_id)
    end
end
