# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.role == 'admin'
        admin_role
      elsif user.role == 'normal'
        normal_role(user)
      elsif user.role == 'editor'
        editor_role(user)
      end
    end
  end
end

private

def normal_role(user)
  can [:update, :create], [Article, Comment], user_id: user.id
  can :read, Article, :all
  can [:destroy, :create, :read], [Comment], user_id: user.id
  can [:manage], [Thumb], user_id: user.id
end

def editor_role(user)
  can :manage, Article, :all
  can :manage, Comment, user_id: user.id
  can :manage, Thumb, user_id: user.id
end


def admin_role
  can :manage, :all
end
