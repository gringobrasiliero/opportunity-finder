class UserSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :application
  has_one :profile
end
