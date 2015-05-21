class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      # handle the guests
      return scope.none if user.nil?
      
      if user.admin?
        scope.all
      else 
        scope.where(user:user)
      end
    end
  end

end