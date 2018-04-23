class Opportunity < ApplicationRecord
  validates :title, presence:true
validates :description, presence:true
belongs_to :user
has_many :applications
has_many :users, :through => :applications

  # has_many :applications
  # accepts_nested_attributes_for :applications

def applications_attributes=(application_attributes)
  application_attributes.values.each do |application_attribute|
  application = Application.find_or_create_by(application_attribute)
  self.applications.update(application_attribute)
end
end

end
