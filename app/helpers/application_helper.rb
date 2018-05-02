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

def logged_in?
   current_user != nil
 end

def has_profile?
 current_user.profile != nil
end

def sort
  sort_by{ |t| [t.legal.to_i, t.created_at] }
end




end
