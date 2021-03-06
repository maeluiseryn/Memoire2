#require 'digest'
class User < ActiveRecord::Base

  attr_accessor :password
  
  attr_accessible :name , :email ,:password , :password_confirmation

  validates :name, :presence   => true ,
                   :length     => { :maximum => 50 },
                   :uniqueness => true

  validates :email, :presence   => true ,
                    :format     => { :with => /(\A[\w.]+[@][a-zA-Z0-9]+[.][a-zA-Z]{2,3}\z)/i} ,
                    :uniqueness => true

  # email_regex =  /(\A[a-zA-Z0-9]+[@][a-zA-Z]+[.][a-zA-Z]{2,3}\z)/i ou ((\A[\w.]+[@][a-zA-Z0-9]+[.][a-zA-Z]{2,3}\z))

  validates :password, :presence=> true,
                       :confirmation => true,
                       :length => { :within => 8..40 }
  #validates :salt, :presence=> true

  before_save :encrypt_password if new_record?

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end


  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end


end
