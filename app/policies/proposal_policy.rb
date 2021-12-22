class ProposalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    new?
  end


  def show?
    true
  end

  def update?
    true
  end

  def accepted?
    true
  end

  def declined?
    true
  end
end
