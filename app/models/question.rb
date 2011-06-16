class Question < ActiveRecord::Base
  validates_presence_of :label, :content
  has_many :answers
  has_many :votes
end
