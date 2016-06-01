class FoundGem

  attr_accessor :name, :project_uri, :desc, :author, :downloads
  @@all = []

  def initialize(name, uri)
    @name = name
    @project_uri = uri
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def get_data
    index = open(@project_uri)
    doc = Nokogiri::HTML(index)
    @desc = doc.css(".gem__desc p").text
    @downloads = doc.css(".gem__downloads").first.text
    @author = doc.css(".t-list__item p").text
  end

end