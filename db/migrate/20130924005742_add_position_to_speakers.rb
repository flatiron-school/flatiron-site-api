class AddPositionToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :position, :integer
  end
end
