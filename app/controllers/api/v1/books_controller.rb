class Api::V1::BooksController < ActionController::API
  # GET /api/v1/books
  def index
    @books = Book.all
    render json: @books
  end

  # GET /api/v1/books/:id
  def show
    @book = Book.find(params[:id])
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

  # PUT /api/v1/books/:id
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # POST /api/v1/books/:id/borrow
  def borrow_book
    @book = Book.find(params[:id])
    
    if @book.amount <= 0
      render json: { error: "Book is not available for borrowing" }, status: :unprocessable_entity
      return
    end
    
    @borrow = Borrow.new(
      user_id: params[:user_id],
      book_id: @book.id,
      borrow_date: Date.today,
      expected_return_date: Date.today + 14.days
    )
    
    if @borrow.save
      @book.update(amount: @book.amount - 1)
      
      # Create a history record
      History.create(
        user_id: params[:user_id],
        book_id: @book.id,
        action: "borrowed",
        date: Date.today
      )
      
      render json: @borrow, status: :created
    else
      render json: @borrow.errors, status: :unprocessable_entity
    end
  end

  # POST /api/v1/books/:id/return
  def return_book
    @book = Book.find(params[:id])
    @borrow = Borrow.find_by(book_id: @book.id, user_id: params[:user_id], return_date: nil)
    
    if @borrow.nil?
      render json: { error: "No active borrow record found for this user and book" }, status: :not_found
      return
    end
    
    @borrow.update(return_date: Date.today)
    @book.update(amount: @book.amount + 1)
    
    # Create a history record
    History.create(
      user_id: params[:user_id],
      book_id: @book.id,
      action: "returned",
      date: Date.today
    )
    
    render json: @borrow
  end

  # DELETE /api/v1/books/:id
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  private
    def book_params
      params.permit(:name, :author, :releaseYear, :amount)
    end
end
