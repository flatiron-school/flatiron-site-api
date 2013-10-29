class Employer < ActiveRecord::Base
  attr_accessible :after_flatiron, :before_flatiron, :student, :title, :position, :img
  has_attached_file :img, :styles => { :medium => "450x309>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :url => ":s3_domain_url"

  validates_uniqueness_of :title
  validates_presence_of :position
  validates_presence_of :student
  validates_presence_of :before_flatiron
  validates_presence_of :after_flatiron
  validates :img, :attachment_presence => true
end
