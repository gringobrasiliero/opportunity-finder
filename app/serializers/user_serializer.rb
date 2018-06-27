class UserSerializer < ActiveModel::Serializer
  attributes :id
# belongs_to :applications
  has_one :profile
end
