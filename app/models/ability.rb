class Ability
  include CanCan::Ability

  def initialize user
    can :read, Tour
    can :read, Review
    can :read, Category
    return unless user.present?
    can :create, Review
    can %i(create update), Rating
    can :read, Booking, user_id: user.id
    return unless user.admin?
    can :manage, :all
  end
end
