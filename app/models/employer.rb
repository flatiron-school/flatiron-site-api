class Employer < ActiveRecord::Base
  attr_accessible :after_flatiron, :before_flatiron, :student, :title, :img
  has_attached_file :img, :styles => { :medium => "450x309>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
