class GemExist::SearchRubygems

  attr_accessor :search_term, :url, :results, :names, :project_uri, :desc, :author, :downloads

  def initialize(search_term)
    @names = []
    @project_uri = []
    @search_term = search_term
    #add ability to handle multi word strings? gems don't appear to contain spaces?
    @url = "https://rubygems.org/api/v1/search.json?query=#{search_term}"
    get_search_results
  end

  def get_search_results
    @results = JSON.load(open(url))
    narrow_results
    populate_fields
    display_names
  end

  def narrow_results
    # default search returns up to 30 results, making more manageable size
    while @results.size > 7
      @results.pop
      # will i need a different return value?
    end
  end

  def populate_fields
    @results.each{|a|
      @names << a["name"]
      @project_uri << a["project_uri"]
    }
  end

  def display_names
    puts "-------------------------------------------"
    @names.each_with_index{|a, i| puts "#{i+1}. #{a}"}
    puts "-------------------------------------------"
  end

  def get_gem_data(num)
    this_url = @project_uri[num - 1]
    index = open(this_url)
    doc = Nokogiri::HTML(index)
    @desc = doc.css(".gem__desc p").text
    @downloads = doc.css(".gem__downloads").first.text
    @author = doc.css(".t-list__item p").text
  end
  
end









