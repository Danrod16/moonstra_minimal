class Team < ApplicationRecord
  validates :name, presence: true #uniqueness: true
  has_many :teams_project, dependent: :destroy
  has_many :projects, through: :teams_project, dependent: :destroy
  has_many :users, dependent: :nullify
  def members
    self.users
  end

  def projects
    self.projects
  end
end
