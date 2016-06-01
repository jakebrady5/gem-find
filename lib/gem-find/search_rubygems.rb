class GemFind::SearchRubygems

  attr_accessor :search_term, :url, :results

  def initialize(search_term)
    @names = []
    @project_uri = []
    @search_term = search_term
    @url = "https://rubygems.org/api/v1/search.json?query=#{search_term}"
    get_search_results
  end

  def get_search_results
    @results = JSON.load(open(url))
    create_gem_data(narrow_results)
    display_names
  end

  def narrow_results
    @results.take(10)
  end

  def create_gem_data(narrowed)
    narrowed.each{|a|
      name = a["name"]
      uri = a["project_uri"]
      FoundGem.new(name, uri)
    }
  end

  def display_names
    puts "-------------------------------------------"
    FoundGem.all.each_with_index{|a, i| puts "#{i+1}. #{a.name}"}
    puts "-------------------------------------------"
  end
  
end









