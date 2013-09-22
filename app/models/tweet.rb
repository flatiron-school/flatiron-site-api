class Tweet < ActiveRecord::Base
  attr_accessible :content, :screen_name, :tweet_date_time
end
