class News < ActiveRecord::Base
  # attr_accessible :title, :content, :news_image
  has_permalink :title, :update => true
  has_attached_file :news_image,
                    :styles => { :thumb => "150x150>", :medium => "300x300>" }
  #validates_attachment_presence :news_image
  validates :title, :presence => true,
                    :length => {:minimum => 1, :maximum => 254}
  validates :content, :presence => true

end
