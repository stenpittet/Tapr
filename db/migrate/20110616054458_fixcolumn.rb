class Fixcolumn < ActiveRecord::Migration
  def self.up
    remove_column :answers, :question_id
    add_column :answers, :question_id, :integer
  end

  def self.down
  end
end
