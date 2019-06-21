class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.date :dob
      t.text :address
      t.string :email
      t.string :phone_number
      t.boolean :admin, :default => false
      t.boolean :suspended, :default => false

      t.timestamps
    end
  end
end
