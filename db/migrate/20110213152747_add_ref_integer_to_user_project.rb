class AddRefIntegerToUserProject < ActiveRecord::Migration
  def self.up
   add_column :clients , :ref_client , :integer
   add_column :projects, :ref_project , :integer
  end

  def self.down
   remove_column :projects, :ref_project
   remove_column :clients , :ref_client
  end
end
