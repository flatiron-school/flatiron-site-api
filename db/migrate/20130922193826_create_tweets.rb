class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :screen_name
      t.text :content
      t.string :tweet_date_time

      t.timestamps
    end
  end
end
