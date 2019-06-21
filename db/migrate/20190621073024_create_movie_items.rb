class CreateMovieItems < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_items do |t|
      t.string :type
      t.boolean :in_store, :default => true
      t.date :borrow_date

      t.timestamps
    end
  end
end
