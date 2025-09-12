class Api::V1::BooksController < ActionController::API
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /api/v1/books
  def index
    @books = Book.all
    render json: @books
  end

  # GET /api/v1/books/:id
  def show
    render json: @book
  end

  # POST /api/v1/books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/books/:id
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/books/:id
  def destroy
    @book.destroy
  end
end
