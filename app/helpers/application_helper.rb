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



end
