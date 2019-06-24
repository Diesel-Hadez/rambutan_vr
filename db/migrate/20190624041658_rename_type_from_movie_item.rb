class RenameTypeFromMovieItem < ActiveRecord::Migration[5.2]
  def change
    rename_column :movie_items, :type, :item_type
  end
end
