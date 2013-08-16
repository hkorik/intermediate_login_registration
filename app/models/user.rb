class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :comments
  
  validates :first_name, 	presence: 	true,
  							length: 	{ maximum: 50 }
  validates :last_name,		presence: 	true,
  							length: 	{ maximum: 50 }
  validates :email, 		presence: 	true,
  							uniqueness: { case_sensitive: false },
  							format: 	{ with: email_regex }
  validates :password,		length:  	{ within: 6..20 }

  before_save { self.email = email.downcase }
  has_secure_password
end
