# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "task_with_airbrake/version"

Gem::Specification.new do |s|
  s.name        = "task_with_airbrake"
  s.version     = TaskWithAirbrake::VERSION
  s.authors     = ["Teruo Adachi"]
  s.email       = ["interu@sonicgarden.jp"]
  s.homepage    = ""
  s.summary     = %q{Task with Airbrake}
  s.description = %q{Error handling in rake task}

  s.rubyforge_project = "task_with_airbrake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake", [">= 0"]
  s.add_development_dependency "airbrake", [">= 0"]
  s.add_dependency "airbrake", [">= 0"]
  s.add_dependency "rails", [">= 0"]
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
