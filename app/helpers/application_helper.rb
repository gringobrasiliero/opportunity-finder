module ApplicationHelper


  def logged_in?
    current_user != nil
  end

def has_profile?
  current_user.profile != nil
end
end
