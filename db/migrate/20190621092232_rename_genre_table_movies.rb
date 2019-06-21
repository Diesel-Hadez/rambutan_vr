class RenameGenreTableMovies < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :genre, :genre_id
  end
end
