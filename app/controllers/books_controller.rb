class BooksController < ApplicationController
  def index
    @books = Book.all
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
      new: params[:new_or_old] == "true",
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