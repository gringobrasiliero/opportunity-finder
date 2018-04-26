class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
has_one :profile
has_many :opportunities
has_many :applications
has_many :opportunities, :through => :applications

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :uid, :confirmable
end
