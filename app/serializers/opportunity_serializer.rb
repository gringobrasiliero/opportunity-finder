class OpportunitySerializer < ActiveModel::Serializer
  attributes :id
has_many :applications, serializer: OpportunityApplicationsSerializer





end
