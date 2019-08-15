module ApplicationHelper
  def owner(type)
    current_user && current_user.id == type
  end
end
