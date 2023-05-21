class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end
  def update?
    user.present?
  end

  def destroy?
    user.present? && user == record.post.comment
  end
end
