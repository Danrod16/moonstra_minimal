class Proposal < ApplicationRecord
  belongs_to :client
  belongs_to :teams_project
  has_many :deliverables, through: :proposal_deliverable
  validates :title, presence: true
  validates :total_price, presence: true
  validates :expiry_date, presence: true
  accepts_nested_attributes_for :client, reject_if: :all_blank, allow_destroy: true
end
