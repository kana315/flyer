class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin_flg?
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
