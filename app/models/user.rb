class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :activities
  has_many :location_activities, through: :activities

  validates :name, presence: :true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  def user_locations
    my_locations = []
    if activities.length > 1
      activities.each do |activity|
        activity.locations.each do |location|
          my_locations << location.name
        end
      end
      my_locations.uniq!
    end
  end

end
