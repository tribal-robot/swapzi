class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def pending?
    true
  end

  def completed?
    true
  end

  def show?
    true
  end

  def dashboard?
    true
  end

  def profile?
    true
  end
end
