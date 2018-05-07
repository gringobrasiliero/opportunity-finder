class Profile < ApplicationRecord
  belongs_to :user
has_many :applications, :through => :user


end
