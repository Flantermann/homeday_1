class AddRealtorToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :realtor_id, :integer
  end
end
