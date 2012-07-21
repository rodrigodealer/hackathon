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
    
    before do
      user = FactoryGirl.create :user
      sign_in user
    end
    
    it "deveria vincular uma feature a uma role" do
      feature = Feature.new
      features = [ feature ]
      role = Role.new
      post :vincula_feature, :id => 1, :role => role, :features => features
      response.should be_success
    end
    
  end
end
