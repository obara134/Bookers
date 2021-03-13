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
   if @book.save
      redirect_to nbook_path(book.id)
      flash[:notice] = "Book was successfully created." 
   else
     @books = Book.all
      render :new
   end
   
 end 

  def edit
    @book = Book.find(params[:id])
    if @book.save
      
      flash[:notice] = "Book was successfully updated." 
    else
     @books = Book.all
     render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
   
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
    flash[:notice] = "Book was successfully updated." 
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path(book)
    flash[:notice] = "Book was successfully destroyed." 
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end  
  
  
end
