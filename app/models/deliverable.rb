class Deliverable < ApplicationRecord
  validates :title, presence: true
  validates :total_price, presence: true
  validates :expiry_date, presence: true
end
