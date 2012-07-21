class RolesController < ApplicationController
  def index
    @roles = Role.all
  end
  
  def vincula_feature
    role = Role.find(params[:role_id])
    features = params[:features_list]
    features.each do |feature|
      role_feature = Role_feature.new(:role => role.id, :feature => feature)
      role_feature.save
    end
    flash[:notice] = "Vinculacao feita com sucesso"
    redirect_to :index
  end
end
