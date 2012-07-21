module UsersHelper
  def checked? user, role
    user.roles.include?(role) ? "checked=checked" : nil
  end
end
