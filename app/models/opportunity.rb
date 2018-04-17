class Opportunity < ApplicationRecord
  validates :title, presence:true
validates :description, presence:true
has_many :users, through: :applications
  belongs_to :user
end
