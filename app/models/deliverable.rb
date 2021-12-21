class Deliverable < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  has_many :proposal_deliverables, dependent: :destroy
end
