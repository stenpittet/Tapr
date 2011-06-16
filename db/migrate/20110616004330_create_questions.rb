class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :label
      t.string :content
      t.integer :nb_votes, :default => 0
      t.boolean :published, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
