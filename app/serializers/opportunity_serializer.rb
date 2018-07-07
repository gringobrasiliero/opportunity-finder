class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :title, :description
has_many :applications, serializer: OpportunityApplicationsSerializer





end
