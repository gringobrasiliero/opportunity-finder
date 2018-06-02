module ApplicationHelper


  def logged_in?
    current_user != nil
  end

  def provider?
    current_user.opportunity_provider == true
  end

  def searcher?
    current_user.opportunity_provider == false
  end

  def has_profile?
   current_user.profile != nil
  end

  def timestamp(submission)
    if submission.updated_at == submission.created_at
  submission.created_at.strftime("Created on %A, %b %e, at %l:%M %p")
    else
    submission.updated_at.strftime("Updated on %A, %b %e, at %l:%M %p")
    end
  end

end
