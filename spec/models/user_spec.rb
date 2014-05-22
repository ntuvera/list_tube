require 'spec_helper'

describe User do
  it "User has a name" do
    User.name.should be_valid

  expect(User.name.should be_valid).to eq(true)
  end
end
