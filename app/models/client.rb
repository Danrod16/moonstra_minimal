class Client < ApplicationRecord
  validates :cif, presence: true
  has_many :proposals, inverse_of: :client
end
