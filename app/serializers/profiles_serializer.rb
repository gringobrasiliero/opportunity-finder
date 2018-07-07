class ProfilesSerializer < ActiveModel::Serializer
  attributes :id,  :first_name, :last_name, :picture_url, :location, :application_id, :email, :profession, :user_id
    belongs_to :applications
end
