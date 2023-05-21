class PostPolicy < ApplicationPolicy

  def index?
    false
  end

  def show?
    true
  end

  def create?
    user.present?
  end


  def destroy?
    user.present? && user == record.author
  end

  def update?
    user.present? && user == record.author
  end

end