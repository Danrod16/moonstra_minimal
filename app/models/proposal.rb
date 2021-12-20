class Proposal < ApplicationRecord
  belongs_to :client
  belongs_to :team_project
end
