class OpportunitiesSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id
has_many :applications
has_one :profile
end
