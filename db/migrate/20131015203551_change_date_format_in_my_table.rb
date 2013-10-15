class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def self.up
   change_column :events, :date_time, :datetime
  end

  def self.down
   change_column :events, :date_time, :datetime
  end
end
