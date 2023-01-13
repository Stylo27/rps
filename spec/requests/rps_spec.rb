# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RpsController, type: :request do
  describe 'GET /' do
    it 'should return a homepage' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('ROCK – PAPER – SCISSORS')
    end
  end

  describe 'GET /throw' do
    let(:server_throw) { create(:game_session, user_throw: 'rock', server_throw: 'scissors', status: 'won') }

    it 'redirects to homepage with messages' do
      expect(Rps::Play).to receive(:call).with('rock').and_return(server_throw)

      get '/throw', params: { user_throw: 'rock' }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to('/')
      follow_redirect!

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('You won, opponent threw scissors')
    end
  end
end
