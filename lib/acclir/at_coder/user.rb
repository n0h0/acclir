# frozen_string_literal: true

module Acclir
  module AtCoder
    # AtCoder User
    class User
      class << self
        def login(user, password)
          LoginSession.create(user, password)
        end
      end
    end
  end
end
