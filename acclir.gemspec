# frozen_string_literal: true

require_relative "lib/acclir/version"

Gem::Specification.new do |spec|
  spec.name = "acclir"
  spec.version = Acclir::VERSION
  spec.authors = ["n0h0"]
  spec.email = ["kusakatsubasa@gmail.com"]

  spec.summary = "AtCoder CLI developed in Ruby."
  spec.homepage = "https://github.com/n0h0/acclir"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/n0h0/acclir"
  spec.metadata["changelog_uri"] = "https://github.com/n0h0/acclir/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.7.2"
  spec.add_dependency "faraday-cookie_jar", "~> 0.0.7"
  spec.add_dependency "minitest"
  spec.add_dependency "nokogiri", "~> 1.13.10"
  spec.add_dependency "thor", "~> 1.2.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
