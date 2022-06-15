class AddIndexToAppointments < ActiveRecord::Migration[7.0]
  def change
    def up
      add_earthdistance_index :appointments
    end

    def down
      remove_earthdistance_index :appointments
    end
  end
end
