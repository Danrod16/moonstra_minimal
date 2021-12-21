class Category < ApplicationRecord
  TYPES = ["Web development", "Design", "SEO"]
  validates :name, presence: true, inclusion: { in: TYPES }

  has_many :project_categories
  has_many :projects, through: :project_categories
end
