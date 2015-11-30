# copied below, check validity
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = 'gem_exist'
  s.version = '0.0.0'
  s.date = '2015-11-24'
  s.summary = "Search rubygems.org for gem info."
  s.description = "Search rubygems.org for gem info."
  s.author = ["Jake Brady"]
  s.email = "jakebrady5@gmail.com"
  s.files = ["lib/gem_exist.rb", "lib/gem_exist/cli.rb", "lib/gem_exist/search_rubygems.rb", "lib/gem_exist/version.rb"]
  s.executables = ["gem-exist"]
  s.require_paths = ["lib", "lib/gem_exist"]
  s.platform = Gem::Platform::CURRENT

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "pry"
  s.add_development_dependency "open-uri"
  s.add_development_dependency "json"
end