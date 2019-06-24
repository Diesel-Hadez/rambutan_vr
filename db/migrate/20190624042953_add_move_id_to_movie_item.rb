class AddMoveIdToMovieItem < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_items, :movie_id, :integer
  end
end
