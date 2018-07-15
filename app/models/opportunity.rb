class Opportunity < ApplicationRecord
  validates :title, presence:true
  validates :description, presence:true

  belongs_to :user
  has_many :applications, :dependent => :destroy
  has_many :users, :through => :applications
  has_one :profile, :through => :user

end
