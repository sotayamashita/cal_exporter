require 'spec_helper'

describe Expoter do

  before do
    @format = "jekyll"
    @save_location = "~/Desktop"
  end

  it "should create yml file" do
  	Expoter.new()
  end
   

end