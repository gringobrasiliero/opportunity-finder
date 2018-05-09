class Opportunity < ApplicationRecord
  validates :title, presence:true
  validates :description, presence:true

  belongs_to :user
  has_many :applications
  has_many :users, :through => :applications

end
