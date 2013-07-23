class Question < ActiveRecord::Base
  attr_accessible :description, :topic

  has_many :answers

  validates :topic, presence: true
end
