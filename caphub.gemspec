# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "caphub/version"

Gem::Specification.new do |s|
  s.name        = "caphub"
  s.version     = Caphub::VERSION
  s.authors     = ["Andriy Yanko"]
  s.email       = ["andriy.yanko@gmail.com"]
  s.homepage    = "https://github.com/railsware/caphub"
  s.summary     = %q{Generate centralized capistrano skeleton for multiple deployment}
  s.description = %q{Generate centralized capistrano skeleton for multiple deployment}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 1.9.3'
end
