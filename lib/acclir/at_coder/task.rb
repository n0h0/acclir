# frozen_string_literal: true

require "open-uri"
require "nokogiri"

module Acclir
  module AtCoder
    # AtCoder problem
    class Task
      SAMPLE_INPUT_TITLE = "Sample Input"
      SAMPLE_OUTPUT_TITLE = "Sample Output"

      attr_reader :contest_id, :id

      def initialize(contest_id, id)
        @contest_id = contest_id
        @id = id
      end

      def samples
        @samples ||= extract_samples.map { |input, output| Sample.new(input, output) }
      end

      private

      def url
        @url ||= ATCODER_TASK_URL_PROC.call(contest_id, id)
      end

      def document
        @document ||= Nokogiri::HTML(URI.parse(url).open)
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
