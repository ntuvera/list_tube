require 'spec_helper'

describe User do
  it "User has a name" do
    User.name.should be_valid

  end
end
