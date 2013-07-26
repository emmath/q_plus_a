class Answer < ActiveRecord::Base
  belongs_to :question
  has_and_belongs_to_many :user
  attr_accessible :response
  validates :response, :presence => true
end
