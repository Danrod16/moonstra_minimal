class Proposal < ApplicationRecord
  belongs_to :client
  belongs_to :team_project
  has_many :deliverables, through: :proposal_deliverable
  validates :title, presence: true
  validates :total_price, presence: true
  validates :expiry_date, presence: true
end
