class Location < ApplicationRecord
  belongs_to :user
  has_many :location_activities
  has_many :activities, through: :location_activities

  validates :name, presence: true
end
