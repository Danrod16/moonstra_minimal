class Project < ApplicationRecord
  validates :name , presence: true
  validates :description , presence: true

  has_many :teams_projects, dependent: :destroy
  has_many :project_categories
  has_many :categories, through: :project_categories, dependent: :destroy
  belongs_to :user


end
