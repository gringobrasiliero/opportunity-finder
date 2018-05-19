class Profile < ApplicationRecord
validates :first_name, :presence => { message: "required"}
validates :last_name, :presence => { message: "required"}
validates :location, :presence => { message: "required"}
validates :picture_url, :presence => { message: "required"}
validates :profession, :presence => { message: "required"}
 validates_format_of :picture_url, :with => URI::regexp(%w(http https))

  belongs_to :user


end
