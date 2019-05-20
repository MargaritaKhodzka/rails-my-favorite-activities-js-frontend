class Activity < ApplicationRecord
  belongs_to :user
  has_many :location_activities
  has_many :locations, through: :location_activities

  validates :name, presence: true
end
