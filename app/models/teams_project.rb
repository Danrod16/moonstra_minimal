class TeamsProject < ApplicationRecord
  belongs_to :team
  belongs_to :project
  has_many :proposals, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members, dependent: :destroy
  STATUSES = ["pending", "accepted", "declined"]

  def accepted?
    self.status == "accepted"
  end

  def pending?
    self.status == "pending"
  end

  def declined?
    self.status == "declined"
  end
end
