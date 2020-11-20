class ComputerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    return true if user.present? #&& user == computer.user
  end
 
  def destroy?
    return true if user.present? #&& user == computer.user
  end
 
  private
 
    def computer
      record
    end
end
