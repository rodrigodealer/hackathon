require 'spec_helper'

describe RolesController do
  
  describe "GET 'index'" do
    
    before {login}
    
    it "deveria acessar com sucesso" do
      get :index
      response.should be_success
    end
    
  end
  
  describe "POST 'vincula_feature'" do
    
    before {login}
    
    it "deveria vincular uma feature a uma role" do
      
    end
    
  end
end
