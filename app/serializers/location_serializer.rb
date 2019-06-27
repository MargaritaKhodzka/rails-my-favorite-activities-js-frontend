class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :zip_code
  has_many :location_activities
  has_many :activities, through: :location_activities
end
