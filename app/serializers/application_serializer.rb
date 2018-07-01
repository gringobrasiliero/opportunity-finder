class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :legal, :transportation, :description_of_criminal_record, :month_commitment, :reason_for_interest, :criminal_record, :qualified
  belongs_to :opportunity
  belongs_to :profile

end
