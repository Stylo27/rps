# frozen_string_literal: true

module Rps
  class Play
    RULES = {
      rock: :scissors,
      scissors: :paper,
      paper: :rock
    }.freeze

    attr_reader :user_throw, :server_throw

    def self.call(*args)
      new(*args).call
    end

    def initialize(user_throw)
      @user_throw = user_throw&.to_sym
    end

    def call
      @server_throw = Rps::ServerThrow.call.to_sym
      status = :draw if user_throw == server_throw
      status = :lost if RULES[user_throw] != RULES[server_throw]
      status = :won if RULES[user_throw] == server_throw
      build_result(status)
    end

    private

    def build_result(status)
      {
        status:,
        server_throw:
      }
    end
  end
end
