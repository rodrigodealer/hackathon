module RolesHelper
  def checked_feature? role, feature
    role.features.include?(feature) ? "checked=checked" : nil
  end
end
