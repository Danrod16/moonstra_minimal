class ProjectPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    new?
  end
end
