class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :title
      t.string :student
      t.string :before_flatiron
      t.string :after_flatiron

      t.timestamps
    end
  end
end
