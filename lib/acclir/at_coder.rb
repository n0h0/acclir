# frozen_string_literal: true

require_relative "./at_coder/contest"
require_relative "./at_coder/sample"
require_relative "./at_coder/task"

module Acclir
  module AtCoder
    ATCODER_URL = "https://atcoder.jp"

    ATCODER_TASKS_PATH_PROC = ->(contest_id) { "/contests/#{contest_id}/tasks" }
    ATCODER_TASKS_URL_PROC = ->(contest_id) { "#{ATCODER_URL}/contests/#{contest_id}/tasks" }

    ATCODER_TASK_PATH_REGEX_PROC = ->(contest_id) { %r{^/contests/#{contest_id}/tasks/(?<task>\w+)$} }
    ATCODER_TASK_URL_PROC = ->(contest_id, task_id) { "#{ATCODER_URL}/contests/#{contest_id}/tasks/#{task_id}" }
  end
end
