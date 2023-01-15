# frozen_string_literal: true

module Acclir
  module AtCoder
    # Communication with AtCoder
    class Connection
      ATCODER_ROOT_URL = "https://atcoder.jp"
      COOKIE_JAR_FILE_PATH = "/tmp/acclir_cookie.yml"

      class << self
        def connection
          @connection ||= Faraday.new(url: ATCODER_ROOT_URL) do |faraday|
            faraday.use :cookie_jar, jar: cookie_jar
            faraday.response :raise_error
          end
        end

        def get(path, &block)
          connection.get(path, &block)
        end

        def post(path, save_cookie: false, &block)
          FileUtils.rm(COOKIE_JAR_FILE_PATH) if save_cookie

          connection.post(path, &block).tap do
            save_cookie_jar if save_cookie
          end
        end

        private

        def cookie_jar
          @cookie_jar ||= if File.exist?(COOKIE_JAR_FILE_PATH)
                            HTTP::CookieJar.new.load(COOKIE_JAR_FILE_PATH)
                          else
                            HTTP::CookieJar.new
                          end
        end

        def save_cookie_jar
          cookie_jar.save(COOKIE_JAR_FILE_PATH, session: true)
        end
      end
    end
  end
end
