class UsersSerializer < ActiveModel::Serializer
  attributes :id, :profile_id
belongs_to :applications
  has_one :profile, serializer: OpportunityApplicationsSerializer
end
