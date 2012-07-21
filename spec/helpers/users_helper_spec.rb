require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RolesHelper. For example:
#
# describe RolesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe UsersHelper do
  
  context "Com roles inclusas" do
    describe "checked?" do
      before do
        @role = Role.new
        @user = User.new
        @user.roles << @role
      end
      
      it "deveria retornar checked" do
        helper.checked?(@user, @role).should be_eql "checked=checked"
      end
      
    end
  end
  
  context "Sem roles inclusas" do
    describe "checked?" do
      before do
        @user = User.new
      end
      
      it "deveria retornar nil" do
        helper.checked?(@user, @role).should be_nil
      end
    end
  end
  
  
end
