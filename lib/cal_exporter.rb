require "cal_exporter/version"
require "icalendar"
require "open-uri"
require "thor"
require "date"
require "pry"


module CalExporter
  class CLI < Thor
    
    desc "calendar CALENDER_ID FORMAT SAVE_LOCATION", "Export calender with specified file format"
    def calendar(calendar_id, format, save_location)
      import = Importer.new(calendar_id)
      calendars = import.fetch
      export = Exporter.new(format, save_location)

      calendars.each do |calendar|
        calendar.events.each do |event|
          say export.save_as_jekyll(event)
        end
      end
      say "Successfully created Files under #{save_location}.",  :green
    end
  end

  require 'cal_exporter/importer'
  require 'cal_exporter/exporter'
  
end



