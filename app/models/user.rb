class User < ActiveRecord::Base
  attr_accessible :name , :email
  validates :name, :presence   => true ,
                   :length     => { :maximum => 50 },
                   :uniqueness => true

  validates :email, :presence   => true ,
                    :format     => { :with => /(\A[\w.]+[@][a-zA-Z0-9]+[.][a-zA-Z]{2,3}\z)/i} ,
                    :uniqueness => true

  # email_regex =  /(\A[a-zA-Z0-9]+[@][a-zA-Z]+[.][a-zA-Z]{2,3}\z)/i ou ((\A[\w.]+[@][a-zA-Z0-9]+[.][a-zA-Z]{2,3}\z))
end
