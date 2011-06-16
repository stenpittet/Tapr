class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :question_id
      t.integer :answer_id
      t.timestamps
    end
    remove_column :questions, :nb_votes
    remove_column :answers, :nb_votes
    add_column :questions, :votes_count, :integer, :default => 0
    add_column :answers, :votes_count, :integer, :default => 0
  end

  def self.down
    drop_table :votes
    remove_column :questions, :votes_count
    remove_column :answers, :votes_count
    add_column :questions, :nb_votes, :integer, :default => 0
    add_column :answers, :nb_votes, :integer, :default => 0
  end
end
