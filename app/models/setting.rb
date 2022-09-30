class Setting < ActiveRecord::Base
  # attr_accessible :name, :content, :setting_image
  has_attached_file :setting_image, :styles => { :thumb => "100x100",
                                                 :medium => "200x200",
                                                 :large => "320x320" }
end
