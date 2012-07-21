require 'spec_helper'

describe RolesHelper do
  
  context "Com roles inclusas" do
    describe "checked?" do
      before do
        @role = Role.new
        @feature = Feature.new
        @role.features << @feature
      end
      
      it "deveria retornar checked" do
        helper.checked_feature?(@role, @feature).should be_eql "checked=checked"
      end
      
    end
  end
  
  context "Sem roles inclusas" do
    describe "checked?" do
      before do
        @role = Role.new
      end
      
      it "deveria retornar nil" do
        helper.checked_feature?(@role, @feature).should be_nil
      end
    end
  end
end
