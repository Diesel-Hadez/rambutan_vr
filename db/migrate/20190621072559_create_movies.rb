class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.date :release_date
      t.integer :minutes
      t.text :description

      t.timestamps
    end
  end
end
