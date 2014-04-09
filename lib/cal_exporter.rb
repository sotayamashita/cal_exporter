require "cal_exporter/version"
require "icalendar"
require "open-uri"
require "thor"
require "date"
require "thor"
require "pry"
require "pry-nav"
require "rspec-nc"
require "guard"
require "awesome_print"


module CalExporter
  class CLI < Thor
    
    desc "calender CALENDER_ID FORMAT SAVE_LOCATION", "Export calender with specified file format"
    def calender(calendar_id, format, save_location)
      import = Importer.new(calendar_id)
      calendars = import.fetch
      export = Exporter.new(format, save_location)

      calendars.each do |calendar|
        calendar.events.each do |event|  
          say export.save_as_jekyll(event)
        end
      end
      say "Successfully created Files under #{save_location}.", :green
    end
  end

  require 'cal_exporter/importer.rb'
  require 'cal_exporter/exporter.rb'
  
end



