class Location < ApplicationRecord
  belongs_to :user
  has_many :location_activities
  has_many :activities, through: :location_activities

  validates :name, presence: true

  def activities_attributes=(activities_attributes)
    activities_attributes.values.each do |activity_attribute|
      activity = Activity.find_or_create_by(activity_attribute)
      self.activities << activity if activity.persisted?
    end
  end
end
