Gem::Specification.new do |s|
  s.name         = "clap"
  s.version      = "1.0.0"
  s.summary      = "Command line argument parsing for simple applications."
  s.description  = "Clap is a small library that can be bundled with your command line application. It covers the simple case of executing code based on the flags or parameters passed."
  s.authors      = ["Michel Martens"]
  s.email        = ["michel@soveran.com"]
  s.homepage     = "http://github.com/soveran/clap"
  s.files        = Dir[ "LICENSE", "README.markdown", "Rakefile", "lib/**/*.rb", "*.gemspec", "test/**/*.rb" ]
  s.add_development_dependency "cutest"
end
