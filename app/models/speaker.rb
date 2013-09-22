class Speaker < ActiveRecord::Base
  attr_accessible :bio, :full_name, :job_title, :profile_img_url, :screen_name

  validates_uniqueness_of :screen_name
  validates_presence_of :screen_name
  validates_presence_of :job_title
end
