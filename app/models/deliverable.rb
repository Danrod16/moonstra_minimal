class Deliverable < ApplicationRecord
  validates :title, presence: true
  validates :total_price, presence: true
  validates :expiry_date, presence: true
  has_many :proposal_deliverable, depedent: :destroy
end
