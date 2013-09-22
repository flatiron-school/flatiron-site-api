class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :full_name
      t.string :screen_name
      t.string :job_title
      t.string :profile_img_url
      t.text :bio

      t.timestamps
    end
  end
end
