# encoding: UTF-8
require 'spec_helper'
describe Role do
  describe "Associa feature" do
    before do
      role = mock_model Feature
      Feature.should_receive(:find).with(any_args()).exactly(3).times.and_return role
    end

    it "deveria associar feature" do
      features = [1, 2, 3]
      role = Role.new
      role = role.vincula features
      role.should have(3).features
    end
  end
end



