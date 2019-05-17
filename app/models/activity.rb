class Activity < ApplicationRecord
  belongs_to :user
  has_many :user_activities
  has_many :locations, through: :user_activities

  validates :name, presence: true
end
