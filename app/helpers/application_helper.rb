module ApplicationHelper
  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def shallow_args(parent, child)
    child.try(:new_record) ? [parent, child] : child
  end
end