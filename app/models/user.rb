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
  has_many :projects, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :teams_projects, through: :project_members, dependent: :destroy
  belongs_to :team, optional: true
  has_one_attached :photo

  ROLES = ["admin", "regular"]
  TEAM_ROLES = ["commander", "astronaut"]

  def regular?
    self.role == "regular"
  end

  def admin?
    self.role == "admin"
  end

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
