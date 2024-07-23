class FollowRequestPolicy < ApplicationPolicy
  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def create?
    true # true since anybody can send follow request
  end

  def update?
    # allows to update if the user is the sender or the recipient
    user == follow_request.sender || follow_request.recipient 
  end

  def destroy?
    update?
  end
end
