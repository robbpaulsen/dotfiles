# -*- encoding: utf-8 -*-
# stub: weakref 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "weakref".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/ruby/weakref", "source_code_uri" => "https://github.com/ruby/weakref" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yukihiro Matsumoto".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-11-07"
  s.description = "Allows a referenced object to be garbage-collected.".freeze
  s.email = ["matz@ruby-lang.org".freeze]
  s.homepage = "https://github.com/ruby/weakref".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Allows a referenced object to be garbage-collected.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<delegate>.freeze, [">= 0"])
end
