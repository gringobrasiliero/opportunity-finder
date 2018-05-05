module OpportunitiesHelper


  def applications_attributes=(application_attributes)
    application_attributes.values.each do |application_attribute|
    application = Application.find_or_create_by(application_attribute)
    self.applications.update(application_attribute)
  end
  end

  def best_candidates
  @opportunity.applications.order(legal: :desc, qualified: :desc, transportation: :desc, criminal_record: :asc, created_at: :desc)

  end

end
