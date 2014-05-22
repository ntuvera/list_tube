require 'spec_helper'

describe ClipsController do
  it "Clips have a video key- url" do
      Clip(:url).should be_valid
  end
end
