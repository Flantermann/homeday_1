class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.datetime :time

      t.timestamps
    end
  end
end
