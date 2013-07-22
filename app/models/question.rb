class Question < ActiveRecord::Base
  attr_accessible :description, :topic

  validates :topic, presence: true
end
