# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      return unless user

      if user.admin?
        can :manage, :all
      else
        can [:read, :new, :create,], Student if user.create?
        can [:edit, :update, :read], Student if user.edit?
        can [:read, :destroy], Student if user.destroy?
      end
  end
end
