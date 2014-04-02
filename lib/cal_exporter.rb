require "cal_exporter/version"
require "thor"

module CalExporter
  class CLI < Thor
    
    desc "calender CALENDER_ID FILE_FORMAT, SAVE_LOCATION", "export calender with specified file format"
    def calender(calendar_id, file_format, save_location)
      cal_exporter = Exporter.new(calendar_id, file_format, save_location)
      cal_exporter.execute(calendar_id, file_format, save_location)
    end

  end


  class Exporter

  	def initialize(calendar_id, file_format, save_location)
  	  @calendar_id   = calendar_id
  	  @file_format   = file_format
  	  @save_location = save_location
  	end


  	def execute(calendar_id, file_format, save_location)
  		event = fetch(calendar_id)
  		content = event.send("#to_{format}") rescue nil
  		save(save_location content)
  	end


  	def fetch(calendar_id)
  	end


  	def to_jekyll(event)
  	end


  	def save(save_location, content)
  	end 

  end
end


CalExporter::CLI.start(ARGV)
