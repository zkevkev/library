class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:parent_id])
    @books = @author.books.order(params[:sort])
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
end