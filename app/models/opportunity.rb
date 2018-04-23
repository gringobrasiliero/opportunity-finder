class Opportunity < ApplicationRecord
  validates :title, presence:true
validates :description, presence:true
belongs_to :user
has_many :applications
has_many :users, :through => :applications

# has_many :applications_opportunities
# has_many :applications, through: :applications_opportunities

  accepts_nested_attributes_for :applications

def applications_attributes=(application_attributes)
  application_attributes.values.each do |application_attribute|
  application = Application.find_or_create_by(application_attribute)
  self.applications << application
end
end

end
