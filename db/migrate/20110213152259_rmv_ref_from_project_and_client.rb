class RmvRefFromProjectAndClient < ActiveRecord::Migration
def self.up
   remove_column :projects, :ref_project
   remove_column :clients , :ref_client
  end

  def self.down
   add_column :clients , :ref_client , :string
   add_column :projects, :ref_project , :string
  end
end
