class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:parent_id])
    @books = @author.books
  end
end