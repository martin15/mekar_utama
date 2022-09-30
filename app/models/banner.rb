class Banner < ActiveRecord::Base
  # attr_accessible :banner_image
  has_attached_file :banner_image, :url => "/system/:attachment/:id/:style/:basename.:extension", 
                                   :styles => { :thumb => "200x200",
                                                :medium => "400x400",
                                                :large => "900x900" }
  validates_attachment_presence :banner_image
end
