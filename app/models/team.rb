class Team < ApplicationRecord
  validates :name, presence: true #uniqueness: true
  has_many :teams_projects, dependent: :destroy
  has_many :projects, through: :teams_projects, dependent: :destroy
  has_many :users, dependent: :nullify
  after_create :welcome_diamonds

  def members
    self.users
  end

  private

  def welcome_diamonds
    self.diamonds =+ 10
    self.save!
  end
end
