class Team < ApplicationRecord
  validates :name, presence: true #uniqueness: true
  has_many :teams_project, dependent: :destroy
  has_many :projects, through: :teams_project, dependent: :destroy
  has_many :users, dependent: :nullify
  after_create :welcome_diamonds

  private

  def welcome_diamonds
    self.diamonds =+ 10
    self.save!
  end
end
