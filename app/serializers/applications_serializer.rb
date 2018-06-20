class ApplicationsSerializer < ActiveModel::Serializer
  attributes :id, :qualified, :legal, :month_commitment, :reason_for_interest, :transportation, :criminal_record, :description_of_criminal_record, :created_at, :updated_at
end
