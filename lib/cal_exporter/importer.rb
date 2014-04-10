module CalExporter
  class Importer 


    def initialize(calendar_id)
      @calendar_id = calendar_id
    end
  

    def fetch
      calender_url = "https://www.google.com/calendar/ical/#{@calendar_id}/public/basic.ics"  
      calendars = open (calender_url) { |cal| Icalendar.parse(cal) }
    end


  end
end