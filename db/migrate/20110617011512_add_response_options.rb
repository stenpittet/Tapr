class AddResponseOptions < ActiveRecord::Migration
  def self.up
    add_column :questions, :redirect_results, :boolean, :default => true
  end

  def self.down
    remove_column :questions, :redirect_results
  end
end
