class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :fullName, :qualified, :legal, :month_commitment, :reason_for_interest, :transportation, :criminal_record, :description_of_criminal_record, :created_at, :updated_at
has_one :user
  belongs_to :opportunity, serializer: OpportunityApplicationsSerializer
  has_one :profile

def fullName()
  "#{application.profile.first_name} #{application.profile.last_name}"

end
