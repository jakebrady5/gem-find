# copied below, check validity
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = 'gem-find'
  s.version = '0.1.0'
  s.date = '2015-11-24'
  s.summary = "Search rubygems.org for gem info."
  s.description = "Search rubygems.org for gem info."
  s.author = ["Jake Brady"]
  s.email = "jakebrady5@gmail.com"
  s.files = ["lib/gem-find.rb", "lib/gem-find/cli.rb", "lib/gem-find/search_rubygems.rb", "lib/gem-find/version.rb"]
  s.executables = ["gem-find"]
  s.require_paths = ["lib", "lib/gem-find"]
  s.platform = Gem::Platform::CURRENT

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "pry"
  s.add_development_dependency "open-uri"
  s.add_development_dependency "json"
end