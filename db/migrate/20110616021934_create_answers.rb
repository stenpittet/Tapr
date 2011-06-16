class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :question_id
      t.string :content
      t.integer :nb_votes, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
