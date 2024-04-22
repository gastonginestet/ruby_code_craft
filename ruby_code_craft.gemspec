# frozen_string_literal: true

require_relative "lib/ruby_code_craft/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_code_craft"
  spec.version = RubyCodeCraft::VERSION
  spec.authors = ["Gastón Ginestet"]
  spec.email = ["gastonauginestet@gmail.com"]

  spec.summary       = "A Ruby gem for generating and executing dynamic Ruby code"
  spec.description   = <<-DESC
    RubyCodeCraft is a Ruby gem that provides a simple interface for generating and executing dynamic Ruby code strings.
    It includes a RubyCodeGenerator class that allows users to dynamically generate Ruby code strings and execute them within their applications.
    The gem is useful for tasks such as dynamically generating and running Ruby scripts, creating code templates, and automating code generation tasks.
  DESC
  spec.homepage = "https://github.com/gastonginestet/ruby_code_craft"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gastonginestet/ruby_code_craft"
  spec.metadata["changelog_uri"] = "https://github.com/gastonginestet/ruby_code_craft/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      f == File.basename(__FILE__) || # Exclude this gemspec file
      f.end_with?('.gem') ||          # Exclude all .gem files
      f.match(%r{\A(?:test|spec|features)/}) || # Exclude test, spec, and features directories
      f.start_with?('.')              # Exclude all hidden files and directories
    end
  end  
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
