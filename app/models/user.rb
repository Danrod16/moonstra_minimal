class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # , :confirmable
  validates :first_name ,presence: true
  validates :last_name ,presence: true
  validates :role ,presence: true
  validates :team_role ,presence: true
  has_many :teams_projects, through: :project_members
  ROLES = ["admin", "regular"]
  TEAM_ROLES = ["commander", "astronaut"]

  def astronaut?
    self.role == "astronaut"
  end

  def commander?
    self.role == "commander"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
