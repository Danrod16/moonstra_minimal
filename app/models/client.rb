class Client < ApplicationRecord
  validates :cif, presence: true
end
