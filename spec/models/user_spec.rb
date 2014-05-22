require 'spec_helper'

describe User do
  it "User should have a proper password" do
    test = User.new(:name => 'Nate')
    test.should be_valid

  expect(test.should be_valid).to eq(true)
  end
end
