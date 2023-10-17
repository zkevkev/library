class BooksController < ApplicationController
  def index
    @books = Book.all

    if params[:search_by_name] && params[:search_by_name] != ""
      @books = @books.where("name like ?", 
      "%#{params[:search_by_name]}%")
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update({
      name: params[:name],
      new: params[:new_or_old] == "new",
      publish_date: params[:publish_date]
    })

    book.save
    redirect_to "/child_table_name/#{book.id}"
  end

  def delete
    Book.destroy(params[:id])

    redirect_to "/child_table_name"
  end
end