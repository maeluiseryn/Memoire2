class Client < ActiveRecord::Base

  has_many :projects

  attr_accessible :name , :first_name 

  validates :name ,       :presence => true ,
                          :length     => { :maximum => 50 }
  validates :first_name , :presence => true ,
                          :length     => { :maximum => 50 }
  validates :ref_client , :uniqueness => true
  before_save :generate_ref

  private

  def generate_ref

    self.ref_client=Client.maximum("ref_client")+1 if new_record?
  end
end
