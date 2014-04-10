require 'spec_helper'

describe CalExporter::Importer do

  before do 
    @calender_id = "engineyard.com_f0a3jqaqooc9r7kmk2hiblojgs@group.calendar.google.com"
  end

  it "should return calender data" do 
    CalExporter::Importer.new(@calender_id).fetch[0].class.should equal(Icalendar::Calendar)
  end

end