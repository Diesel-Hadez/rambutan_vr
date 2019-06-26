class MovieItemsController < ApplicationController
  before_action :set_movie_item, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:destroy]

  def index
    @movie_items = MovieItem.all
  end

  def show
    set_movie_item
  end  

  def new
    @movie_item = MovieItem.new
  end

  def edit
    set_movie_item
  end

  def create
    @movie_item = MovieItem.new(movie_item_params)
    if @movie_item.save
      flash.now[:success] = "MovieItem was successfully create"
      redirect_to @movie_item
    else
      render 'new'
    end
  end

  def destroy
    movie_item = set_movie_item
    movie_item.destroy
    redirect_to movie_items_url, notice: "Movie Item was successfully destroyed."
  end

  private
  def set_movie_item
    @movie_item = MovieItem.find(params[:id])
  end

  def movie_item_params
    params.require(:movie_item).permit(:movie_id, :item_type)
  end

  def admin_user
    redirect_to root_url unless is_admin?
  end
end
