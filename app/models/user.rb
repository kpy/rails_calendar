# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  attr_accessor :password
  
  before_save :encrypt_password
  before_save { |user| user.email = email.downcase }

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  # Länge des Benutzernamens auf 50 Zeichen beschränken
  validates :name,  presence: true, length: { maximum: 50 }

  # Mit regulärem Ausdruck aussehen der Email-Adresse festlegen
  # Email-Adresse muss einmalig sein
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }


  def self.authenticate(email, password)
	  user = User.find_by_email(email)
	  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	    user
	  else
	    nil
	  end
  end 

  def encrypt_password
	  if password.presence?
	    self.password_salt = BCrypt::Engine.generate_salt
	    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	  end
  end
end
