class AddPositionColumnToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :position, :integer
  end
end
