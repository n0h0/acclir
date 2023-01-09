# frozen_string_literal: true

require "thor"

require_relative "./command/new"

module Acclir
  # Acclir CLI
  class CLI < Thor
    package_name "Acclir"

    def self.exit_on_failure?
      true
    end

    register(Command::New, "new", "new CONTEST_ID", "Generate files for the contest")
  end
end
