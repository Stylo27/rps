# frozen_string_literal: true

class GameSession < ApplicationRecord
  validates :user_throw, :server_throw, :status, presence: true
end
