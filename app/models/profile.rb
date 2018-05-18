class Profile < ApplicationRecord
validates :first_name, :presence => { message: "First name required"}
validates :last_name, :presence => { message: "Last name required"}
validates :location, :presence => { message: "What area do you live in?"}
validates :picture_url, :presence => { message: "We need a picture URL to identify your name to a face."}
validates :profession, :presence => { message: "What is your profession?"}

  belongs_to :user


end
