class ProjectMember < ApplicationRecord
  belongs_to :teams_project
  belongs_to :user
end
