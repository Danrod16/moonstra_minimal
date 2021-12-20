class Client < ApplicationRecord
  validates :cif, presence: true
  has_many :proposals, dependent: :destroy
end
