# encoding: utf-8

require 'spec_helper'

describe CalExporter::Exporter do

  before do
    @format = "jekyll"
    @save_location = "~/Desktop/meetups"
  end

  it "should create file for jeykyll" do
    	
  end


  it "should create file specified its name" do
    
  end


  it "should return url array" do 
     CalExporter::Exporter.new(@format, @save_location).url_list("お申込み：http://phpstudy.doorkeeper.jp/\n開催場所：株式会社 Engine Yard\n会場までの動画：http://www.youtube.com/watch?v=Yspc7MMb9d4").class.should eq(Array)
  end
   

end