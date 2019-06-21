class ChangeDataTypeGenreTableMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :genre, :integer
  end
end
