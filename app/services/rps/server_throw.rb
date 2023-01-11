# frozen_string_literal: true

module Rps
  class ServerThrow
    AVAILABLE_THROWS = %w[rock paper scissors].freeze

    def self.call
      new.call
    end

    def call
      response = send_throw
      return JSON.parse(response.body)['message'] if response.code == 200

      AVAILABLE_THROWS.sample
    end

    private

    def send_throw
      HTTParty.get(Rails.application.credentials.rps_url)
    end
  end
end
