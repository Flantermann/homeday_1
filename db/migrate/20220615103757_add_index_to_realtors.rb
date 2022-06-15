class AddIndexToRealtors < ActiveRecord::Migration[7.0]
  def change
    def up
      add_earthdistance_index :realtors
    end

    def down
      remove_earthdistance_index :realtors
    end
  end
end
