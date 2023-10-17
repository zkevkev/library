class AuthorsController < ApplicationController
  def index
    @authors = Author.order(created_at: :desc)
    
    if params[:search_by_name] && params[:search_by_name] != ""
      @authors = @authors.where("name like ?", 
      "%#{params[:search_by_name]}%")
    end
    
    @authors = @authors.order(params[:sort_by])
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