class RolesController < ApplicationController
  def index
    @roles = Role.all
  end
  
  def new
    @role = Role.new
    @features = Feature.all
  end
  
  def create
    role_params = params[:role]
    features = params[:role][:features]
    role_params.delete(:features)
    role = Role.new role_params
    role.save
    
    role.vincula features
    redirect_to roles_path
  end
  
  def show
    @role = Role.find params[:id]
  end
  
  def vincula_feature
    role = Role.find(params[:role_id])
    features = params[:features_list]
    role.vincula features
    
    flash[:notice] = "Vinculacao feita com sucesso"
    redirect_to roles_path
  end
end
