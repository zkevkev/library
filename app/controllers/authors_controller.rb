class AuthorsController < ApplicationController
  def index
    @authors = Author.order(created_at: :desc)
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    author = Author.create!({
      name: params[:name],
      dead: params[:doa] == "dead",
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
      dead: params[:doa] == "dead",
      sales: params[:copies_sold]
    })

    author.save
    redirect_to "/parents/#{author.id}"
  end

  def delete
    Author.destroy(params[:id])

    redirect_to "/parents"
  end
end