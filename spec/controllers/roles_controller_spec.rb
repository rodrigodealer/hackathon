require 'spec_helper'

describe RolesController do
  
  describe "GET 'index'" do
    
    before {login}
    
    it "deveria acessar com sucesso" do
      get :index
      response.should be_success
    end
    
  end
  
end
