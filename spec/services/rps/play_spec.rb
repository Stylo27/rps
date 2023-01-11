# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rps::Play do
  subject { described_class.call(user_input) }
  let(:user_input) { 'rock' }
  let(:server_throw) { :scissors }
  let(:status) { :won }
  let(:expected_result) do
    {
      status:,
      server_throw:
    }
  end

  before { expect(Rps::ServerThrow).to receive(:call).and_return(server_throw) }

  context 'when user won' do
    it { is_expected.to eq(expected_result) }
  end

  context 'when user lost' do
    let(:status) { :lost }
    let(:server_throw) { :paper }

    it { is_expected.to eq(expected_result) }
  end

  context 'when draw' do
    let(:status) { :draw }
    let(:server_throw) { :rock }

    it { is_expected.to eq(expected_result) }
  end
end
