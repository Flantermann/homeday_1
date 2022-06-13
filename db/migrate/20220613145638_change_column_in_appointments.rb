class ChangeColumnInAppointments < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :lat, :decimal, precision: 10, scale: 6
    change_column :appointments, :lng, :decimal, precision: 10, scale: 6
  end
end
