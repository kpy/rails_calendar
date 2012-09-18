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
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  # Länge des Benutzernamens auf 50 Zeichen beschränken
  validates :name,  presence: true, length: { maximum: 50 }
  
  # Mit regulärem Ausdruck aussehen der Email-Adresse festlegen
  # Email-Adresse muss einmalig sein
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }

  # Passwort muss mindestens 6 Zeichen haben
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end
end
