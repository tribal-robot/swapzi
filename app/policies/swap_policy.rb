class SwapPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(user: @user)
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def pending?
    true
  end

  def completed?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
