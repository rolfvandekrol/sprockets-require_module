$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sprockets/require_module/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sprockets-require_module"
  s.version     = Sprockets::RequireModule::VERSION
  s.authors     = ["Rolf van de Krol"]
  s.email       = ["info@rolfvandekrol.nl"]
  s.homepage    = "https://github.com/rolfvandekrol/sprockets-require_module"
  s.summary     = "Sprockets Require Module"
  s.description = "Sprockets directive require_module to keep a list of assets outside a sprocket manifest in a module"
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "LICENSE", "README.md"]

  s.add_dependency "sprockets", "~> 2.11"
  s.add_dependency "activesupport", "~> 4.0"
end
