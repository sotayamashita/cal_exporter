require "cal_exporter/version"
require "icalendar"
require "open-uri"
require "thor"
require "date"
require "thor"
require 'yaml'

module CalExporter
  class CLI < Thor
    
    desc "calender CALENDER_ID FORMAT, SAVE_LOCATION", "export calender with specified file format"
    def calender(calendar_id, format, save_location)
      cal = Exporter.new(calendar_id, format, save_location)
      cal.execute(calendar_id, format, save_location)
    end

  end



  class Exporter

  	def initialize(calendar_id, format, save_location)
  	  @calendar_id   = calendar_id
  	  @format   = format
  	  @save_location = save_location
  	end


  	def execute(calendar_id, format, save_location)
  		fetch(calendar_id)
  		# content = to_jekyll(event)
  		# save(save_location content)
      # save(content, event)
  	end


  	def fetch(calendar_id)
      calender_url = "https://www.google.com/calendar/ical/#{calendar_id}/public/basic.ics"
    
      calendars = open (calender_url) { |cal| Icalendar.parse(cal) }

      calendars.each do |calendar|
        calendar.events.each do |event| 
          to_jekyll(event)
        end
      end
  	end


  	def to_jekyll(event)

      url = url_list(event.description)
    
      title = event.summary
      new_title = title.sub('[', '(')
      new_title = new_title.sub(']', ')')
      new_title = new_title.sub(':', '&#58;') 

      # List of output
      output_list = {
        "title"         => new_title,
        "location"      => event.location.chomp,
        "date"          => date_format(event.dtstart,'%Y-%m-%d'),
        "friendly_date" => date_format(event.dtstart,'%A %d %b %Y'),
        "link"          => url[0],
        "layout"        => "post",
        "categories"    => "meetup"
      } 

      other_lsit = []

      content = output_list.to_yaml + other_lsit.to_yaml

      save(content, event)
  	end


  	# def save(save_location, content)

    #   current_path = File.expand_path(File.dirname($0))
    #   Dir.mkdir("#{current_path}/meetup") unless Dir.exist?("#{current_path}/meetup")

  	# end

    def save(content, event)
      current_path = File.expand_path(File.dirname($0))
      Dir.mkdir("#{current_path}/meetups") unless Dir.exist?("#{current_path}/meetups")


      # Create file
      f = File.open("#{current_path}/meetups/#{event.uid[0, 7]}.md", "w")
        f.write(content)
      f.close 
    end


    def url_list(description)
      URI.extract(description, %w[http https])
    end


    def date_format(date, datetime_format)
      d = DateTime.parse(date.to_s)
      return d.strftime(datetime_format)
    end
    

  end
end



