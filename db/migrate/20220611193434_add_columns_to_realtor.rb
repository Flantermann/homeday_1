class AddColumnsToRealtor < ActiveRecord::Migration[7.0]
  def change
    add_column :realtors, :lat, :decimal
    add_column :realtors, :lng, :decimal
  end
end
