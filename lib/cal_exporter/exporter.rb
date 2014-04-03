class Exporter


  	def initialize(format, save_location)
  	  @format   = format
      @save_location = save_location
  	end


  	def to_jekyll(event)
      #TODO: Create complete jekyll file
      output_list = {
        "title"         => event.summary.gsub(/[|]|:/, '[' => '(', ']' => ')', ':' => '&#58;'),
        "location"      => event.location.chomp,
        "date"          => event.dtstart.strftime('%Y-%m-%d'),
        "friendly_date" => event.dtstart.strftime('%A %d %b %Y'),  
        "link"          => url_list(event.description)[0],
        "layout"        => "post",
        "categories"    => "meetups"
        "test"          => event.description
      }
  	end


    def save_as_jekyll(event)
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