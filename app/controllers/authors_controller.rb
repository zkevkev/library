class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    # ask about how to test this (RSpec matchers? Stub? Force create date?)
    @authors = @authors.order(created_at: :desc)
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    author = Author.create!({
      name: params[:name],
      dead: params[:dead] == "true",
      sales: params[:copies_sold]
    })

    redirect_to "/parents"
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update({
      name: params[:name],
      dead: params[:dead] == "true",
      sales: params[:copies_sold]
    })

    author.save
    redirect_to "/parents/#{author.id}"
  end
end