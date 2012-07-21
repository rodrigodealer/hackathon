# encoding: UTF-8
require 'spec_helper'

describe User do
  before do
    Rails.cache.clear
  end
  
  describe "#can?" do
    let(:usuario){
      feature1 = FactoryGirl.create(:feature, :action => 'index', :controller => 'people')
      feature2 = FactoryGirl.create(:feature, :action => 'edit', :controller => 'people')
      role = FactoryGirl.create(:role, :name => 'cadastradores', :features => [feature1, feature2])
      FactoryGirl.create(:user, :roles => [role])
    }
    
    context "usuário com acesso à feature" do
      it "usuário deve ter permissão de acesso à listar pessoas" do        
        usuario.can?('people', 'index').should be_true
      end

      it "usuário deve ter permissão de acesso à editar pessoas" do        
        usuario.can?('people', 'edit').should be_true
      end
    end
    
    context "usuário sem acesso à feature" do
      it "usuário deve ter permissão de acesso à listar pessoas" do
        usuario.can?('people', 'new').should be_false
      end
    end
    
    context "como admin" do
      it "usuário deve ter permissão de acesso à listar pessoas" do
        usuario = FactoryGirl.create(:user, :admin => true)
        usuario.can?('people', 'new').should be_true
      end
    end
  end
  
  describe "#cannot?" do    
    let(:usuario){
      FactoryGirl.create(:user)
    }
    
    context "deve negar o can?" do
      it {
        usuario.stub(:can?).and_return(true)
        usuario.cannot?('people', 'index').should be_false
      }

      it {
        usuario.stub(:can?).and_return(false)
        usuario.cannot?('people', 'index').should be_true
      }      
    end
  end
  
  describe "Associa role" do
    before do
      role = mock_model Role
      Role.should_receive(:find).with(any_args()).exactly(3).times.and_return role
    end
    
    it "deveria associar role" do
      roles = [1, 2, 3]
      user = User.new
      user = user.associa roles
      user.should have(3).roles
    end
  end
  
end