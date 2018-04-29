class Opportunity < ApplicationRecord
  validates :title, presence:true
validates :description, presence:true

belongs_to :user
has_many :applications
has_many :users, :through => :applications,  :source=>"user"


  # has_many :applications
  # accepts_nested_attributes_for :applications

  def legal_and_qualified?
      if legal && qualified
        return valid?
      end
  end

end
