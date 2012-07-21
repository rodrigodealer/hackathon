class UsersController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    @roles = Role.all
  end
  
  def edit
    @user = User.find params[:id]
    @roles = Role.all
  end
  
  def create
    user = UserRole.associa(params[:user], nil)
    if user.save
      flash[:notice] = "Usuario criado com sucesso"
    else
      flash[:notice] = "Erro ao criar usuario"
    end
    redirect_to users_path
  end
  
  def update
    user = UserRole.associa(params[:user], params[:id])
    params[:user].delete(:roles)
    if user.update_attributes(params[:user])
      flash[:notice] = "Usuario atualizado com sucesso"
    else
      flash[:notice] = "Erro ao atualizar usuario"
    end
    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end