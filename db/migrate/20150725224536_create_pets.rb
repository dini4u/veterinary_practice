class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.string :breed
      t.integer :age
      t.decimal :weight
      t.datetime :date_of_last_visit
      t.timestamps
    end
  end
end
