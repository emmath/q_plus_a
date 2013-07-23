class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :response
  validates :response, :presence => true
end
