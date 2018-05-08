class Application < ApplicationRecord
validates :user_id, presence: true
validates :opportunity_id, presence: true
validates :qualified, :inclusion => {in: [true, false], :message => "Are you qualified for the position you are applying for?"}
validates :legal,:inclusion => {in: [true, false], message: "Are you Legally allowed to work in the United States?"}
validates :criminal_record,:inclusion => {in: [true, false], message: "Do you have a Criminal Record"}
validates :description_of_criminal_record,:presence => { message: "Please explain any prior convictions. If you have none, type N/A in the box"}
validates :transportation,:inclusion => {in: [true, false], message: "Do you have reliable transportation?"}
validates :month_commitment,:presence => { message: "How long of a commitment are you offering?"}
validates :reason_for_interest,:presence => { message: "Why are you interested in this opportunity?"}

belongs_to :user
belongs_to :opportunity
has_one :profile, :through => :user

accepts_nested_attributes_for :user


def self.from_today
  where("created_at >=?", Time.zone.today.beginning_of_day)
end

def self.best_candidates
order(legal: :desc, qualified: :desc, transportation: :desc, criminal_record: :asc, created_at: :desc)
end




end
