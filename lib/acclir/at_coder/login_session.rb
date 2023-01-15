# frozen_string_literal: true

module Acclir
  module AtCoder
    # AtCoder session
    class LoginSession
      PATH = "/login"

      class << self
        def create(username, password)
          response = Connection.post(PATH, save_cookie: true) do |req|
            req.headers["Content-Type"] = "application/x-www-form-urlencoded"
            req.body =
              URI.encode_www_form({ username: username, password: password, csrf_token: csrf_token })
          end

          raise LoginFailedError if response.headers["location"] == PATH

          true
        end

        private

        def csrf_token
          Nokogiri::HTML(
            Connection.get(PATH).body
          ).xpath(
            "//input[@name='csrf_token']"
          ).first[:value]
        end
      end
    end
  end
end
