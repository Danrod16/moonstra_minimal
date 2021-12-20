class Deliverable < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  has_many :proposal_deliverable, depedent: :destroy
end
