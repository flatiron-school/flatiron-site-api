class AddImgColumnsToEvents < ActiveRecord::Migration
  def self.up
    add_attachment :events, :img
  end

  def self.down
    remove_attachment :events, :img
  end
end
