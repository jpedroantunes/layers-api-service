# frozen_string_literal: true

require_relative "lib/layers_service/version"

Gem::Specification.new do |spec|
  spec.name = "layers_service"
  spec.version = LayersService::VERSION
  spec.authors = ["João F."]
  spec.email = ["jpedaf@gmail.com"]

  spec.summary = "Encapsulates the main Layers Service API calls"
  spec.description = "Implements the main calls to the routes of the Layers API"
  spec.homepage = "https://github.com/jpedroantunes/layers-api-service"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jpedroantunes/layers-api-service"
  spec.metadata["changelog_uri"] = "https://github.com/jpedroantunes/layers-api-service"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
