class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:parent_id])
    @books = @author.books
    
    if params[:threshold]
      threshold = params[:threshold].to_i
      @books = @books.where("publish_date >= #{threshold}")
    end

    @books = @books.order(params[:sort_by])
  end

  def new
    @author = Author.find(params[:parent_id])
  end

  def create
    author = Author.find(params[:parent_id])
    book = author.books.create!({
      name: params[:name],
      new: params[:new_or_old] == "new",
      publish_date: params[:publish_date]
    })

    redirect_to "/parents/#{book.author_id}/child_table_name"
  end
end