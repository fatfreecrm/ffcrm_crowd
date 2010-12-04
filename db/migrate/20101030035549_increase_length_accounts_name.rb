class IncreaseLengthAccountsName < ActiveRecord::Migration
  def self.up
    change_column :accounts, :name, :string, :limit => 128
  end

  def self.down
    change_column :accounts, :name, :string, :limit => 64
  end
end
