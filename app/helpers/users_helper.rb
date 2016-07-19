module UsersHelper
  def admin_user?
    current_user.admin?
  end
end
