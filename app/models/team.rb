class Team < ApplicationRecord
  validates :name ,presence: true, uniqueness: true
  has_many :projects, through: :teams_projects
  def members
    self.users
  end

  def projects
    self.projects
  end
end
