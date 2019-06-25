class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  def show
    set_movie
    @available_vhs = @movie.movie_items.where(in_store: true, item_type: "VHS")
    @available_dvd = @movie.movie_items.where(in_store: true, item_type: "DVD")
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    set_movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      #actor_list = movie_params[:actor_list];
      #actor_list.each do |a| 
      #  ActorMovie.create!(movie_id: @movie.id, actor_id: a.id)
      #end
      flash.now[:success] = "Movie was successfully created"
      redirect_to @movie
    else
      render 'new'
    end
  end

  # PATCH/PUT /movies/1
  def update
    @movie.update(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render 'edit'
    end
  end

  # DELETE /movies/1
  def destroy
    movie = set_movie
    movie.destroy
    redirect_to movies_url, notice: "Movie was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :genre_id, :release_date, :minutes, :description, :actor_list)
    end
end
