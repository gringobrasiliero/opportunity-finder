module ApplicationsHelper

  def users_attributes=(users_attributes)
      user_attributes.values.each do |user_attribute|
        user = User.find_or_create_by(user_attribute)
        self.user = user
      end
  end


def created_at(application)
  application.created_at.strftime("Applied on %A, %b %e, at %l:%M %p")
end

end
