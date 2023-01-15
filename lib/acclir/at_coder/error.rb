# frozen_string_literal: true

module Acclir
  module AtCoder
    # Login Failed
    class LoginFailedError < StandardError
      def initialize
        super("Login failed. Please try again.")
      end
    end
  end
end
