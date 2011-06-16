class Fixcolumn < ActiveRecord::Migration
  def self.up
    Answer.destroy_all
    change_column :answers, :question_id, :integer
  end

  def self.down
  end
end
