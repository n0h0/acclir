# frozen_string_literal: true

module Acclir
  module Command
    # Generate files for the contest
    class New < Thor::Group
      include Thor::Actions

      BASE_NAME = "main"

      argument :contest_id

      attr_accessor :contest, :config

      def self.source_root
        File.dirname(__FILE__)
      end

      def prepare
        self.contest = AtCoder::Contest.new(contest_id)
      end

      def create_contest_files
        contest.tasks.each do |task|
          dir = "#{contest.id}/#{task.id}/"
          file_path = "./#{dir}/#{BASE_NAME}.rb"
          test_file_path = "./#{dir}/#{BASE_NAME}_test.rb"

          create_file file_path

          template(
            "../templates/new/#{BASE_NAME}_test.rb.tt", test_file_path,
            { file_path: file_path, task: task }
          )
        end
      end
    end
  end
end
