require 'spec_helper'

describe CalExporter::Importer do

  context "value required" do
  	subject(:subject) { CalExporter::Importer.new("engineyard.com_f0a3jqaqooc9r7kmk2hiblojgs@group.calendar.google.com") }

    it "should return calender data" do 
       subject.fetch[0].class.should equal(Icalendar::Calendar)
    end

  end

end