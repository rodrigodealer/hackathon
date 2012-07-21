class RolesController < ApplicationController
  def index
    @roles = Role.all
  end
  
  def vincula_feature
    role = Role.find(params[:role_id])
    features = params[:features_list]
    Role.vincula features
    
    flash[:notice] = "Vinculacao feita com sucesso"
    redirect_to roles_path
  end
end
