class UsersController < ApplicationController

  before_filter :authenticate_user!
  
  def index
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
    user = User.new params[:user]
    if user.save
      flash[:notice] = "Usuario criado com sucesso"
    else
      flash[:notice] = "Erro ao criar usuario"
    end
    redirect_to users_path
  end
  
  def update
    user = User.find params[:id]
    if user.update_attributes(params[:user])
      flash[:notice] = "Usuario atualizado com sucesso"
    else
      flash[:notice] = "Erro ao atualizar usuario"
    end
    redirect_to users_path
  end
  
end