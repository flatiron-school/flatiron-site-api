class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :img_url
      t.string :title
      t.date :date_time
      t.text :description
      t.string :signup_link

      t.timestamps
    end
  end
end
