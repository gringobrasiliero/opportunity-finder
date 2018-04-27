class Profile < ApplicationRecord
  belongs_to :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :uid,
         :omniauthable, omniauth_providers: %i[linkedin]

  def self.from_omniauth(auth)
    where(provider: auth.linkedin, uid: auth.uid).first_or_create do |profile|
      profile.first_name = auth.info.first_name
      profile.last_name = auth.info.last_name
       profile.picture_url = auth.info.image
       profile.save
binding.pry
      end
  end
end
