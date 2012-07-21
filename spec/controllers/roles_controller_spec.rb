require 'spec_helper'

describe RolesController do
  
  describe "GET 'index'" do  
    before {login}
    
    it "deveria acessar com sucesso" do
      get :index
      response.should be_success
    end
  end
  
  describe "GET 'new'" do  
    before {login}
    
    it "deveria acessar com sucesso" do
      get :new
      response.should be_success
    end
  end
  
  describe "GET 'show'" do  
    before {
      login
      role = mock_model Role
      Role.should_receive(:find).once.and_return role
    }
    
    it "deveria acessar com sucesso" do
      get :show, :id => 1
      response.should be_success
    end
  end
  
  describe "GET 'edit'" do  
    before {
      login
      role = mock_model Role
      Role.should_receive(:find).once.and_return role
    }
    
    it "deveria acessar com sucesso" do
      get :edit, :id => 1
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    before {
      login
      feature = mock_model Feature
      Feature.should_receive(:find).exactly(3).times.and_return feature
    }
    
    it "deveria postar com sucesso" do
      role = FactoryGirl.attributes_for :role
      role[:features] = [1, 2, 3]
      post :create, :role => role
      response.should be_redirect
    end
  end
  
  describe "PUT 'update'" do
    before {
      login
      feature = mock_model Feature
      role = mock_model Role
      role.should_receive(:vincula)
      role.should_receive(:update_attributes).and_return true
      Role.should_receive(:find).exactly(1).times.and_return role
    }
    
    it "deveria postar com sucesso" do
      role = FactoryGirl.attributes_for :role
      role[:features] = [1, 2, 3]
      put :update, :id => 1, :role => role
      response.should be_redirect
    end
  end
  
  describe "PUT 'update'" do
    before {
      login
      feature = mock_model Feature
      role = mock_model Role
      role.should_receive(:vincula)
      role.should_receive(:update_attributes).and_return false
      Role.should_receive(:find).exactly(1).times.and_return role
    }
    
    it "deveria postar com falha" do
      role = FactoryGirl.attributes_for :role
      role[:features] = [1, 2, 3]
      put :update, :id => 1, :role => role
      response.should be_redirect
    end
  end
  
  describe "POST 'vincula_feature'" do
    before {
      login
      feature = mock_model Feature
      role = mock_model Role
      role.should_receive(:vincula).once
      Role.should_receive(:find).once.and_return role
    }
    
    it "deveria postar com sucesso" do
      post :vincula_feature, :id => 1
      response.should be_redirect
    end
  end
  
end
