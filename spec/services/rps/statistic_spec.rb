# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rps::Statistic do
  subject { described_class.call }

  context 'when user has game session' do
    let!(:user_win_sessions) { create_list(:game_session, 5, user_throw: 'rock', server_throw: 'scissors', status: 'won') }
    let!(:server_win_sessions) { create_list(:game_session, 5, user_throw: 'rock', server_throw: 'paper', status: 'lost') }
    let!(:draw_sessions) { create_list(:game_session, 10, user_throw: 'rock', server_throw: 'rock', status: 'draw') }
    let(:expected_result) do
      {
        user_wins: 5,
        server_wins: 5,
        win_percentage: 25
      }
    end

    it 'returns statistic of total games' do
      is_expected.to eq(expected_result)
    end
  end

  context 'when user does not have any game session' do
    let(:expected_result) { {} }

    it 'returns empty hash' do
      is_expected.to eq(expected_result)
    end
  end
end
