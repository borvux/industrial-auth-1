class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  def feed?
    true
  end

  def discover?
    feed? # true
  end

  def create?
    discover? # true
  end

  def edit?
    user == current_user
  end

  def update?
    edit? # user = current_user
  end

  def destroy?
    update? # user = current_user
  end

  def show_photos?
    user == current_user ||
            !user.private || 
            user.followers.include?(current_user) ||
            current_user.followers.include?(user)
  end
end
