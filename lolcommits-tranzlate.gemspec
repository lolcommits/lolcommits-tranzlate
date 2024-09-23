lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lolcommits/tranzlate/version'

Gem::Specification.new do |spec|
  spec.name        = "lolcommits-tranzlate"
  spec.version     = Lolcommits::Tranzlate::VERSION
  spec.authors     = ["Matthew Hutchinson"]
  spec.email       = ["matt@hiddenloop.com"]
  spec.summary     = %q{lolcommits lolspekk tranzlation plugin}
  spec.homepage    = "https://github.com/lolcommits/lolcommits-tranzlate"
  spec.license     = "LGPL-3.0"
  spec.description = %q{TRANZLATE YOAR LOLCOMMIT MSG TO LOLSPEKK}

  spec.metadata = {
    "homepage_uri"      => "https://github.com/lolcommits/lolcommits-tranzlate",
    "changelog_uri"     => "https://github.com/lolcommits/lolcommits-tranzlate/blob/master/CHANGELOG.md",
    "source_code_uri"   => "https://github.com/lolcommits/lolcommits-tranzlate",
    "bug_tracker_uri"   => "https://github.com/lolcommits/lolcommits-tranzlate/issues",
    "allowed_push_host" => "https://rubygems.org"
  }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(assets|test|features)/}) }
  spec.test_files    = `git ls-files -- {test,features}/*`.split("\n")
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1"
  spec.add_runtime_dependency "lolcommits", ">= 0.17.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
