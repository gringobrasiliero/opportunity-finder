class Application < ApplicationRecord
validates :user_id, presence: true
validates :opportunity_id, presence: true

belongs_to :user
accepts_nested_attributes_for :user
  belongs_to :opportunity
has_many :users
has_one :profile, :through => :user
# has_many :applications_opportunities
#   has_many :opportunites, through: :applications_opportunities
def users_attributes=(attr)
    attr.values.each do |a|
      user = User.find_or_create_by(a)
      self.user = user
    end
  end
end
