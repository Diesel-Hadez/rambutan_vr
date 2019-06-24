class CreateActorMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :actor_movies do |t|
      t.belongs_to :actor, index: true
      t.belongs_to :movie, index: true

      t.timestamps
    end
  end
end
