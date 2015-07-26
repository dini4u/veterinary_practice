class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :pet_id, :null => false
      t.integer :customer_id, :null => false
      t.datetime :date_of_visit, :null => false
      t.boolean :appointment_required, :null => false, :default => true
      t.text :reason_for_visit, :null => false
      t.timestamps
    end
  end
end
