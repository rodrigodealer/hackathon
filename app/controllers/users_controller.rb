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
    roles = []
    params[:user][:roles].map {|role|
      roles << Role.find(role)
    }
    params[:user].delete(:roles)
    user = User.new params[:user]
    user.roles = roles
    
    if user.save
      flash[:notice] = "Usuario criado com sucesso"
    else
      flash[:notice] = "Erro ao criar usuario"
    end
    redirect_to users_path
  end
  
  def update
    roles = []
    params[:user][:roles].map {|role|
      roles << Role.find(role)
    }
    user = User.find params[:id]
    user.roles = roles
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