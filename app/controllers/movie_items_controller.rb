class MovieItemsController < ApplicationController
  before_action :set_movie_item, only: [:show, :edit, :update, :destroy]

  # GET /movie_items
  # GET /movie_items.json
  def index
    @movie_items = MovieItem.all
  end

  # GET /movie_items/1
  # GET /movie_items/1.json
  def show
  end

  # GET /movie_items/new
  def new
    @movie_item = MovieItem.new
  end

  # GET /movie_items/1/edit
  def edit
  end

  # POST /movie_items
  # POST /movie_items.json
  def create
    @movie_item = MovieItem.new(movie_item_params)

    respond_to do |format|
      if @movie_item.save
        format.html { redirect_to @movie_item, notice: 'Movie item was successfully created.' }
        format.json { render :show, status: :created, location: @movie_item }
      else
        format.html { render :new }
        format.json { render json: @movie_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_items/1
  # PATCH/PUT /movie_items/1.json
  def update
    respond_to do |format|
      if @movie_item.update(movie_item_params)
        format.html { redirect_to @movie_item, notice: 'Movie item was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie_item }
      else
        format.html { render :edit }
        format.json { render json: @movie_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_items/1
  # DELETE /movie_items/1.json
  def destroy
    @movie_item.destroy
    respond_to do |format|
      format.html { redirect_to movie_items_url, notice: 'Movie item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_item
      @movie_item = MovieItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_item_params
      params.fetch(:movie_item, {})
    end
end
