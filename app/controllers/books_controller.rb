class BooksController < ApplicationController
  def index
  end

  def show
     @book = Book.find(params[:id])
     @books = Book.all
     
  end

  def new
    @book = Book.new
    @books = Book.all
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to "/books/new"
  end

  def edit
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end  
  
  
end
