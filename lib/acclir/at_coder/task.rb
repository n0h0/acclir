# frozen_string_literal: true

module Acclir
  module AtCoder
    # AtCoder problem
    class Task
      SAMPLE_INPUT_TITLE = "Sample Input"
      SAMPLE_OUTPUT_TITLE = "Sample Output"

      PATH_REGEX_PROC = ->(contest_id) { %r{^/contests/#{contest_id}/tasks/(?<task>\w+)$} }
      PATH_PROC = ->(contest_id, id) { "/contests/#{contest_id}/tasks/#{id}" }

      attr_reader :contest_id, :id

      def initialize(contest_id, id)
        @contest_id = contest_id
        @id = id
      end

      def samples
        @samples ||= extract_samples.map { |input, output| Sample.new(input, output) }
      end

      private

      def document
        @document ||= Nokogiri::HTML(
          Connection.get(PATH_PROC.call(contest_id, id)).body
        )
      end

      def extract_samples
        extract_sample_inputs.zip(extract_sample_outputs)
      end

      def extract_sample_inputs
        document.xpath("//*[@id='task-statement']//section").each_with_object([]) do |element, sample_inputs|
          sample_inputs << element.at("./pre").content if element.at("./h3").content.start_with?(SAMPLE_INPUT_TITLE)
        end
      end

      def extract_sample_outputs
        document.xpath("//*[@id='task-statement']//section").each_with_object([]) do |element, sample_outputs|
          sample_outputs << element.at("./pre").content if element.at("./h3").content.start_with?(SAMPLE_OUTPUT_TITLE)
        end
      end
    end
  end
end
