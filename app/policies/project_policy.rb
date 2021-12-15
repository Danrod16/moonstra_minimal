class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(private: false)
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def index?
    true
  end
end
