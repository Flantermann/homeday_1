class AddSellerToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :seller_id, :integer
  end
end
