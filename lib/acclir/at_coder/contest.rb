# frozen_string_literal: true

module Acclir
  module AtCoder
    # AtCoder contest
    class Contest
      TASKS_PATH_PROC = ->(id) { "/contests/#{id}/tasks" }

      attr_reader :id

      def initialize(id)
        @id = id
      end

      def tasks
        @tasks ||= extract_task_ids.map { |task_id| Task.new(id, task_id) }
      end

      private

      def document
        @document ||= Nokogiri::HTML(
          Connection.get(TASKS_PATH_PROC.call(id)).body
        )
      end

      def extract_task_ids
        hrefs = document.xpath("//a[@href]").map do |element|
          element.attribute("href").content
        end

        hrefs.uniq.map { |href| href.match(Task::PATH_REGEX_PROC.call(id))&.[](:task) }.compact
      end
    end
  end
end
