class UserRole
  def self.associa user_params, id
    roles = []
    user_params[:roles].map {|role|
      roles << Role.find(role)
    }
    if id
      user = User.find id
    else
      user_params.delete(:roles)
      user = User.new user_params
    end
    user.roles = roles
    user
  end 
end
