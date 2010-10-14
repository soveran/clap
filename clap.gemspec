Gem::Specification.new do |s|
  s.name              = "clap"
  s.version           = "0.0.2"
  s.summary           = "Command line argument parsing for simple applications."
  s.description       = "Clap is a small library that can be bundled with your command line application. It covers the simple case of executing code based on the flags or parameters passed, and it does so with just under 30 lines of code."
  s.authors           = ["Michel Martens"]
  s.email             = ["michel@soveran.com"]
  s.homepage          = "http://github.com/soveran/clap"
  s.files = ["LICENSE", "README.markdown", "Rakefile", "lib/clap.rb", "clap.gemspec", "test/clap_test.rb"]
  s.add_development_dependency "cutest", "~> 0.1"
end
