module OpportunitiesHelper


  def applications_attributes=(application_attributes)
    application_attributes.values.each do |application_attribute|
    application = Application.find_or_create_by(application_attribute)
    self.applications.update(application_attribute)
  end
  end



end
