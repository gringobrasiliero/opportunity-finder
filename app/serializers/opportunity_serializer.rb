class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id
has_many :applications, serializer: OpportunityApplicationsSerializer
has_one :profile




end
