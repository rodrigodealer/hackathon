require 'spec_helper'

describe UsersController do

  before { login }
  
  describe "GET 'index'" do
    it "deve acessar com sucesso" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "deve acessar com sucesso" do
      get :new
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before do
      user = mock_model User
      User.should_receive(:find).with(any_args()).once.and_return user
    end
    
    it "deve acessar com sucesso" do
      get :edit, :id => 1
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    before do
      user = mock_model User
      User.should_receive(:find).with(any_args()).once.and_return user
    end
    
    it "deve acessar com sucesso" do
      get :show, :id => 1
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    before do
      user = mock_model User
      role = mock_model Role
      user.should_receive(:associa).once
      user.should_receive(:save).with(any_args()).and_return true
      User.should_receive(:new).with(any_args()).and_return user
    end
    
    it "deve postar com sucesso" do
      user_params = FactoryGirl.attributes_for :user
      role = 1
      roles = [ role ]
      post :create, :user => user_params, :roles => roles
      response.should be_redirect
    end
  end
  
  describe "POST 'create'" do
    before do
      user = mock_model User
      role = mock_model Role
      user.should_receive(:associa).once
      user.should_receive(:save).with(any_args()).and_return false
      User.should_receive(:new).with(any_args()).and_return user
      
    end
    
    it "deve postar com falha" do
      user_params = FactoryGirl.attributes_for :user
      role = 1
      roles = [ role ]
      post :create, :user => user_params, :roles => roles
      response.should be_redirect
    end
  end
  
  describe "PUT 'update'" do
    before do
      user = mock_model User
      role = mock_model Role
      user.should_receive(:associa).once
      User.should_receive(:find).with(any_args()).and_return user
      user.should_receive(:update_attributes).with(any_args()).and_return true
    end
    
    it "deve atualizar com sucesso" do
      user_params = FactoryGirl.attributes_for :user
      role = 1
      roles = [ role ]
      put :update, :id => 1, :user => user_params, :roles => roles
      response.should be_redirect
    end
  end
  
  describe "PUT 'update'" do
    before do
      user = mock_model User
      role = mock_model Role
      user.should_receive(:associa).once
      User.should_receive(:find).with(any_args()).and_return user
      user.should_receive(:update_attributes).with(any_args()).and_return false
    end
    
    it "deve atualizar com falha" do
      user_params = FactoryGirl.attributes_for :user
      role = 1
      roles = [ role ]
      put :update, :id => 1, :user => user_params, :roles => roles
      response.should be_redirect
    end
  end
end
