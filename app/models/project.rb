class Project < ApplicationRecord
  validates :name , presence: true
  validates :description , presence: true
  belongs_to :user

  has_many :project_categories
  has_many :teams_projects, dependent: :destroy

  has_many :project_members, through: :teams_projects, dependent: :destroy
  has_many :categories, through: :project_categories, dependent: :destroy

  def project_members
    ProjectMember.where(teams_project: self.teams_projects)
  end
end
