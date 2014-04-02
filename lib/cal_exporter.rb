require "cal_exporter/version"
require "icalendar"
require "open-uri"
require "thor"
require "date"
require "thor"

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
  		event = fetch(calendar_id)
  		content = event.send("#to_{format}") rescue nil
  		# save(save_location content)
  	end


  	def fetch(calendar_id)
      calender_url = "https://www.google.com/calendar/ical/#{calendar_id}/public/basic.ics"
    
      calendars = open (calender_url) { |cal| Icalendar.parse(cal) }

      event = calendars.each do |calendar|
        calendar.events.each { |event| }
      end
  	end


  	def to_jekyll(event)
      # 現在のディレクトリ取得
      current_path = File.expand_path(File.dirname($0))
      # meetup/ ディレクトリがなかったら作成
      Dir.mkdir("#{current_path}/meetup") unless Dir.exist?("#{current_path}/meetup")

      url = url_list(event.description)
    
      title = event.summary
      new_title = title.sub('[', '(')
      new_title = new_title.sub(']', ')')
      new_title = new_title.sub(':', '&#58;') 

      uid = adjust_string_length(event.uid)

      # List of output
      output_list = {
        "title"         => new_title,
        "location"      => event.location,
        "date"          => get_date_format(event.dtstart,'%Y-%m-%d'),
        "friendly_date" => get_date_format(event.dtstart,'%A %d %b %Y'),
        "link"          => url[0],
        "layout"        => "post",
        "categories"    => "meetup",
        "summary"       => event.summary,
      } 

      content = "---\ntitle: #{output_list['new_title']}\nlocation: #{output_list['location']}\ndate: #{output_list['date']}\nfriendly_date: #{output_list['friendly_date']}\nlink: #{output_list['url']}\nlayout: post\ncategories: meetups\n---\n#{output_list['summary']}"

      # Create file
      f = File.open("#{current_path}/meetup/#{output_list['date']}-#{uid}.md", "w")
        f.write(content)
      f.close 
  	end


  	def save(save_location, content)
  	end 

  end
end



