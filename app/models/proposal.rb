class Proposal < ApplicationRecord
  belongs_to :client
  belongs_to :team_project
  has_many :deliverables, through: :proposal_deliverable
end
