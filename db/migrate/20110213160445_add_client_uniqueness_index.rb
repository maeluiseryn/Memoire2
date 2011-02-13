class AddClientUniquenessIndex < ActiveRecord::Migration

def self.up
  add_index :clients , :ref_client , :unique =>true
  end

  def self.down
    remove_index :clients , :ref_client
  end
end

