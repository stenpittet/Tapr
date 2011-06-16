class Fixcolumn < ActiveRecord::Migration
  def self.up
    change_column :answers, :question_id, :integer
  end

  def self.down
  end
end
