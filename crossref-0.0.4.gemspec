# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "crossref"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robert Crim"]
  s.date = "2009-09-20"
  s.description = ""
  s.email = ["robert@servermilk.com"]
  s.executables = ["crossref"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["bin/crossref", "History.txt", "Manifest.txt", "README.txt"]
  s.homepage = "http://github.com/ottbot/crossref/tree"
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "crossref"
  s.rubygems_version = "1.8.23"
  s.summary = ""

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
