class ReviewPolicy < ApplicationPolicy
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
  
    def create?
      present
    end
  
    def new?
      create?
    end
   
    def destroy?
      present
    end
   
    private
   
      def review
        record
      end
  
      def present
        return true if user.present? #&& user == computer.user
      end
  end
  