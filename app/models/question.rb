class Question < ActiveRecord::Base
  attr_accessible :description, :topic
  has_many :answers, dependent: :delete_all
  has_and_belongs_to_many :users

  validates :topic, presence: true
end
