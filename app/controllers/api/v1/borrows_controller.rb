class Api::V1::BorrowsController < ActionController::API
  # GET /api/v1/borrows
  def index
    @borrows = Borrow.all
    render json: @borrows
  end

  # POST /api/v1/borrows/:id/
  def show
    @borrow = Borrow.find(params[:id])
    render json: @borrow
  end
end
