class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:parent_id])
    @books = @author.books
  end

  def new
    @author = Author.find(params[:parent_id])
  end

  def create
    author = Author.find(params[:parent_id])
    book = author.books.create!({
      name: params[:name],
      new: params[:new] == "true",
      publish_date: params[:publish_date]
    })

    redirect_to "/parents/#{book.author_id}/child_table_name"
  end

  def sort
    @author = Author.find(params[:parent_id])
    @books = @author.books
    @books = @books.order(:name)

    redirect_to "/parents/#{@author.id}/child_table_name"
  end
end