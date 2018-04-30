module ProfilesHelper

  def profiles_attributes=(profiles_attributes)
    profile_attributes.values.each do |profile_attribute|
    profile = Profile.find_or_create_by(profile_attribute)
    self.profiles.update(profile_attribute)
  end
  end


end
