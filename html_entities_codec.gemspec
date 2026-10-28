lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "htmlentities/version"

Gem::Specification.new do |s|
  s.name = "html_entities_codec"
  s.version = HTMLEntities::VERSION::STRING
  s.author = "Paul Battley"
  s.email = "pbattley@gmail.com"
  s.description = "A module for encoding and decoding (X)HTML entities."
  s.summary = "Encode/decode HTML entities"
  s.files = Dir["lib/**/*.rb"] + %w[COPYING.txt LICENSE README.md]
  s.licenses = ["Apache-2.0", "MIT"]
  s.require_path = "lib"
  s.extra_rdoc_files = %w[History.txt COPYING.txt LICENSE README.md]
  s.homepage = "https://github.com/zendesk/html_entities_codec"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["changelog_uri"] = "#{s.homepage}/blob/main/History.txt"
  s.metadata["allowed_push_host"] = "https://rubygems.org"
  s.metadata["source_code_uri"] = s.homepage
  s.required_ruby_version = ">= 3.3"
  s.add_development_dependency "rake", "~> 13"
  s.add_development_dependency "rspec", "~> 3"
  s.add_development_dependency "benchmark"
  s.add_development_dependency "ruby-prof"
  s.add_development_dependency "standard"
end
