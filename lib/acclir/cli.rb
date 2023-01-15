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

    desc "login", "Login AtCoder"
    def login
      username = ask("Username:")
      password = ask("Password:", echo: false)

      begin
        AtCoder::User.login(username, password)

        say "\nLogin succeeded!"
      rescue AtCoder::LoginFailedError => e
        say_error "\n#{e.message}"
      end
    end

    register(Command::New, "new", "new CONTEST_ID", "Generate files for the contest")
  end
end
