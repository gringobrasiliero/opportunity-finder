class ProfileSerializer < ActiveModel::Serializer
  attributes :id,  :first_name, :last_name, :picture_url, :location
end
