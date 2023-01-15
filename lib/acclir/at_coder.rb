# frozen_string_literal: true

require "faraday"
require "faraday-cookie_jar"
require "nokogiri"
require "fileutils"

require_relative "./at_coder/connection"
require_relative "./at_coder/error"

require_relative "./at_coder/user"
require_relative "./at_coder/login_session"

require_relative "./at_coder/contest"
require_relative "./at_coder/sample"
require_relative "./at_coder/task"

module Acclir
  # AtCoder
  module AtCoder
  end
end
