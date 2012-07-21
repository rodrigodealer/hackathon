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
    user = User.new params[:user]
    user.associa params[:roles]
    if user.save
      flash[:notice] = "Usuario criado com sucesso"
    else
      flash[:notice] = "Erro ao criar usuario"
    end
    redirect_to users_path
  end
  
  def update
    user = User.find params[:id]
    user.associa params[:roles]
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