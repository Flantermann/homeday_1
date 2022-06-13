class AddReferencesToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :seller, foreign_key: true
    add_reference :appointments, :realtor, foreign_key: true
  end
end
