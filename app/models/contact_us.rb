class ContactUs < ActiveRecord::Base
  # attr_accessible :email, :name, :content

  validates :email, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
  validates :content, :presence => true
end
