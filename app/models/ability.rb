class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Define abilities based on user roles
    if user.role == 'admin'
      can :manage, :all # Admin can manage all resources
    else
      can :read, :all
      can :create, [Post, Comment]
      can :update, Post, author_id: user.id
      can :update, Comment, author_id: user.id
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, author_id: user.id
    end
  end
end
