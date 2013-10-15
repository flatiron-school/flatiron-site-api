class Event < ActiveRecord::Base
  attr_accessible :date_time, :description, :img_url, :signup_link, :title
end
