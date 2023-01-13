# frozen_string_literal: true
AVAILABLE_THROWS = %w[rock paper scissors].freeze

FactoryBot.define do
  factory :game_session do
    user_throw { AVAILABLE_THROWS.sample }
    server_throw { AVAILABLE_THROWS.sample }
    status { %i[draw won lost] }
  end
end