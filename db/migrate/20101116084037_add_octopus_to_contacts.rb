class AddOctopusToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :octopus, :string
  end

  def self.down
    remove_column :contacts, :octopus
  end
end
