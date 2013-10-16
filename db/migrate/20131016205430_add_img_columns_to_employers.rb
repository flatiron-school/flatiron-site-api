class AddImgColumnsToEmployers < ActiveRecord::Migration
  def self.up
    add_attachment :employers, :img
  end

  def self.down
    remove_attachment :employers, :img
  end
end
