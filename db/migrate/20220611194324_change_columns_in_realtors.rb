class ChangeColumnsInRealtors < ActiveRecord::Migration[7.0]
  def change
    change_column :realtors, :lat, :decimal, precision: 10, scale: 6
    change_column :realtors, :lng, :decimal, precision: 10, scale: 6
  end
end
