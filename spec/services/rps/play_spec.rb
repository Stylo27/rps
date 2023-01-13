# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rps::Play do
  subject { described_class.call(user_throw) }
  let(:user_throw) { 'rock' }
  let(:server_throw) { 'scissors' }
  let(:status) { 'won' }
  let(:expected_result) { attributes_for(:game_session, user_throw:, server_throw:, status:) }

  before { expect(Rps::ServerThrow).to receive(:call).and_return(server_throw) }

  context 'when user won' do
    it 'creates game session record' do
      expect { described_class.call(user_throw) }.to change { GameSession.count }
    end
    it 'returns game session with expected attributes' do
      expect(described_class.call(user_throw).attributes.symbolize_keys).to include(expected_result)
    end
  end

  context 'when user lost' do
    let(:status) { 'lost' }
    let(:server_throw) { 'paper' }

    it 'creates game session record' do
      expect { described_class.call(user_throw) }.to change { GameSession.count }
    end
    it 'returns game session with expected attributes' do
      expect(described_class.call(user_throw).attributes.symbolize_keys).to include(expected_result)
    end
  end

  context 'when draw' do
    let(:status) { 'draw' }
    let(:server_throw) { 'rock' }

    it 'creates game session record' do
      expect { described_class.call(user_throw) }.to change { GameSession.count }
    end
    it 'returns game session with expected attributes' do
      expect(described_class.call(user_throw).attributes.symbolize_keys).to include(expected_result)
    end
  end
end
