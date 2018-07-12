class ProfileSerializer < ActiveModel::Serializer
  attributes :id,  :first_name, :last_name, :picture_url, :location, :email, :profession, :user_id, :business_name
    belongs_to :applications
    belongs_to :opportunity
end
