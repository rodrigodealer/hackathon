class Role < ActiveRecord::Base  
  attr_accessible :name, :features
  
  has_many :users_roles, :class_name => "UsersRoles"
  has_many :users, :through => :users_roles

  has_many :roles_features, :class_name => "RolesFeatures"
  has_many :features, :through => :roles_features
  
  def vincula features
    features.each do |feature|
      role_feature = RolesFeatures.new
      role_feature.role = self
      role_feature.feature = Feature.find(feature)
      role_feature.save
    end
  end
end
