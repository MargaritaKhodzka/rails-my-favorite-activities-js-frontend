class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :location_activities
  has_many :activities, through: :location_activities
end
