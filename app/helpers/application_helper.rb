module ApplicationHelper


  def logged_in?
    current_user != nil
  end

def has_profile?
  current_user.profile != nil
end

def legal_and_qualified?
    if legal && qualified
      return valid?
    end
end



end
