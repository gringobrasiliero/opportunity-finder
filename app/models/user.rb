class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

has_many :opportunities, :dependent => :destroy

has_many :applications, :dependent => :destroy

# has_many :opportunities, :through => :applications
has_one :profile, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :uid,
         :omniauthable, omniauth_providers: %i[linkedin]





         def self.from_omniauth(auth)
           where(provider: auth.linkedin, uid: auth.uid).first_or_create do |user|
             user.email = auth.info.email
             user.first_name = auth.info.first_name
             user.last_name = auth.info.last_name
              user.picture_url = auth.info.image
                user.location = auth.info.location(name)
                user.profession = auth.info.profession
                user.positions = auth.info.positions


             user.password = Devise.friendly_token[0,20]
             end
         end

end
