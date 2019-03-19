class Location < ApplicationRecord
  belongs_to :user
  has_many :location_activities
  has_many :activities, through: :location_activities
  accepts_nested_attributes_for :activities

  validates :name, presence: true

  def activities_attributes=(activity)
    self.activities = Activity.find_or_create_by(name: activity.name)
    self.activities.update(activity)
  end
end
