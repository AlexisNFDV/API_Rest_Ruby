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
    true
  end

  def with_filter?
    present
  end

  def show_with_filter?
    present
  end

  def create?
    present
  end

  def new?
    create?
  end

  def update?
     present
  end
 
  def destroy?
    present
  end
 
  private
 
    def computer
      record
    end

    def present
      return true if user.present? #&& user == computer.user
    end
end
