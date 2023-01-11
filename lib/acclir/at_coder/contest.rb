# frozen_string_literal: true

require "open-uri"

module Acclir
  module AtCoder
    # AtCoder contest
    class Contest
      attr_reader :id

      def initialize(id)
        @id = id
      end

      def tasks
        @tasks ||= extract_task_ids.map { |task_id| Task.new(id, task_id) }
      end

      private

      def url
        @url ||= ATCODER_TASKS_URL_PROC.call(id)
      end

      def document
        @document ||= Nokogiri::HTML(URI.parse(url).open)
      end

      def extract_task_ids
        hrefs = document.xpath("//a[@href]").map do |element|
          element.attribute("href").content
        end

        hrefs.uniq.map { |href| href.match(ATCODER_TASK_PATH_REGEX_PROC.call(id))&.[](:task) }.compact
      end
    end
  end
end
