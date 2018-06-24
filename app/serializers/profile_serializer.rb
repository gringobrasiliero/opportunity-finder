class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :first_name, :last_name, :picture_url
  belongs_to :user, serializer: OpportunityApplicationsSerializer
end
