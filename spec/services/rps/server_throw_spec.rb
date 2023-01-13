# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rps::ServerThrow do
  context 'when remote server responds' do
    let(:server_response) do
      instance_double(HTTParty::Response, body: { message: 'rock' }.to_json, code: 200)
    end

    it 'calls external service to receive throw' do
      expect(HTTParty).to receive(:get).and_return(server_response)
      expect(subject.call).to eq('rock')
    end
  end

  context 'when remote server does not respond' do
    let(:server_response) do
      instance_double(HTTParty::Response, body: { message: 'internal error' }.to_json, code: 500)
    end

    it 'calls returns random throw' do
      stub_const('AVAILABLE_THROWS', %w[rock paper scissors])
      expect(HTTParty).to receive(:get).and_return(server_response)
      expect(AVAILABLE_THROWS).to include(subject.call)
    end
  end
end
