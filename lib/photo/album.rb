class Photo::Album
  attr_accessor :albumId, :id, :title, :url, :thumbnailUrl

  def self.now
    self.scrape_photos
  end

  def self.scrape_photos
    photos = []

    photos << self.scrape_jsonplaceholder


    photos

  end

  def self.scrape_jsonplaceholder
    doc = Nokogiri::HTML(open("https://jsonplaceholder.typicode.com/photos"))
    binding.pry
  end

end
