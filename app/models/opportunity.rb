class Opportunity < ApplicationRecord
  validates :title, presence:true
validates :description, presence:true
has_many :users, through: :applications
  belongs_to :user
  has_many :applications
  accepts_nested_attributes_for :applications

def applications_attributes=(application)
  self.application = Application.find_or_create_by(reason_for_interest: application.reason_for_interest)
  self.application.update(application)
end

end
