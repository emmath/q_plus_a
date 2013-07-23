class Question < ActiveRecord::Base
  attr_accessible :description, :topic

  has_many :answers, dependent: :delete_all

  validates :topic, presence: true
end
