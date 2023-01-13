# frozen_string_literal: true

module Rps
  class Statistic
    def self.call
      new.call
    end

    def call
      sessions = GameSession.all
      return {} if sessions.count.zero?

      user_wins = sessions.where(status: 'won').count
      server_wins = sessions.where(status: 'lost').count
      {
        user_wins:,
        server_wins:,
        win_percentage: (user_wins / sessions.count.to_f) * 100
      }
    end
  end
end
