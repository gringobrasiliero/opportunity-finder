module ApplicationsHelper

  def users_attributes=(attr)
      attr.values.each do |a|
        user = User.find_or_create_by(a)
        self.user = user
      end
  end

  def legal_and_qualified?
    if legal && qualified
      return valid?
    end
  end

end
