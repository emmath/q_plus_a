class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :response
  validates :response, :presence => true
end
