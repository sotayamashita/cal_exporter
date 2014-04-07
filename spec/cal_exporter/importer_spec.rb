require 'spec_helper'

describe Importer do

  before do 
    @calender_id = "engineyard.com_f0a3jqaqooc9r7kmk2hiblojgs@group.calendar.google.com"
  end

  # TODO: できればカレンダの値が入っていることを確認する方法を考える
  it "should return calender data" do 
    Importer.new(@calender_id).fetch.should_not be_empty
  end

end