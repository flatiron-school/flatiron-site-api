class Event < ActiveRecord::Base
  attr_accessible :date_time, :description, :img_url, :signup_link, :title, :img
  has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
