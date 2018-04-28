class Application < ApplicationRecord
validates :user_id, presence: true
validates :opportunity_id, presence: true

belongs_to :user
accepts_nested_attributes_for :user
  belongs_to :opportunity
has_many :users



def users_attributes=(attr)
    attr.values.each do |a|
      user = User.find_or_create_by(a)
      self.user = user
    end
end

def legal_and_qualified?
    if legal && qualified
      return valid?
    end
end


end
