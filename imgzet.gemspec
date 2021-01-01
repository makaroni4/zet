$LOAD_PATH << File.expand_path("lib", __dir__)

require "imgzet/version"

Gem::Specification.new do |spec|
  spec.name          = "imgzet"
  spec.version       = Imgzet::VERSION
  spec.authors       = ["Anatoli Makarevich"]
  spec.email         = ["makaroni4@gmail.com"]

  spec.summary       = "CLI tool to organize notes, inspired by Imgzettelkasten"
  spec.description   = "CLI tool to organize notes, inspired by Imgzettelkasten"
  spec.homepage      = "https://github.com/makaroni4/imgzet"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] +
                       ["LICENSE.txt"]

  spec.executables   = ["imgzet"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rmagick", "~> 4"
  spec.add_development_dependency "bundler", "~> 2.2.3"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
