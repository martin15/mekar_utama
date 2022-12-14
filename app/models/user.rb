class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessor :password, :old_password
  # attr_accessible :email, :password, :old_password, :password_confirmation
  before_save :encrypt_password

  validates :password, :presence => {:on => :create},
                       :confirmation => true
  validates :email, :presence => true, :uniqueness => true

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
