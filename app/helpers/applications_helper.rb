module ApplicationsHelper

  def users_attributes=(users_attributes)
      user_attributes.values.each do |user_attribute|
        user = User.find_or_create_by(user_attribute)
        self.user = user
      end
  end

end
