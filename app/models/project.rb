class Project < ActiveRecord::Base

  belongs_to :client
  before_save :generate_ref

  private

   def generate_ref
    nb_project= Client.find_by_id(self.client_id).projects.maximum("ref_project")
    if nb_project!= nil
    self.ref_project= nb_project+1
    else
    self.ref_project=1
    end
  end

end
