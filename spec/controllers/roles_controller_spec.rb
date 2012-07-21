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
  
end
