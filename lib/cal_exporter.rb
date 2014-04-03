require "cal_exporter/version"
require "icalendar"
require "open-uri"
require "thor"
require "date"
require "thor"
require 'yaml'
# For Debug 
# TODO Delete it before publishing
require 'pry'
require 'awesome_print'

module CalExporter
  class CLI < Thor
    
    desc "calender CALENDER_ID FORMAT SAVE_LOCATION", "Export calender with specified file format"
    def calender(calendar_id, format, save_location)
      cal = Importer.new(calendar_id)
      calendars = cal.fetch
      export = Exporter.new(format, save_location)

      # save
      calendars.each do |calendar|
        calendar.events.each do |event|  
          export.save(event)
        end
      end
    end
  end

  # TODO 別ファイルにする
  class Importer 

    def initialize(calendar_id)
      @calendar_id = calendar_id
    end

    def fetch
      calender_url = "https://www.google.com/calendar/ical/#{@calendar_id}/public/basic.ics"  
      calendars = open (calender_url) { |cal| Icalendar.parse(cal) }
    end

  end

  # TODO 別ファイルにする
  class Exporter

  	def initialize(format, save_location)
  	  @format   = format
      @save_location = save_location
  	end



  	def to_jekyll(event)

      output_list = {
        "title"         => event.summary.gsub(/[|]|:/, '[' => '(', ']' => ')', ':' => '&#58;'),
        "location"      => event.location.chomp,
        "date"          => event.dtstart.strftime('%Y-%m-%d'),
        "friendly_date" => event.dtstart.strftime('%A %d %b %Y'),  
        "link"          => url_list(event.description)[0],
        "layout"        => "post",
        "categories"    => "meetups"
      }

  	end


    def save(event)
      # TODOファイルのパスを出す, ファイルパスをオブジェクトフィールドからとってくる

      path = "#{@save_location}/meetups"

      Dir.mkdir(path) unless Dir.exist?(path)

      f = File.open("#{path}/#{event.dtstart.strftime('%Y-%m-%d')}-#{event.uid[0, 7]}.md", "w")
      f.write(to_jekyll(event))
      f.close 
    end


    def url_list(description)
      URI.extract(description, %w[http https])
    end

  end


end



