class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :patient_doctor_id
      t.string :location
      t.datetime :appointment_time
      t.timestamps
    end
  end
end
