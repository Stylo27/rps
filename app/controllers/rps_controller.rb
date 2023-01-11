# frozen_string_literal: true

class RpsController < ApplicationController
  STATUSES = {
    won: :success,
    lost: :danger,
    draw: :warning
  }.freeze

  def index; end

  def throw
    @result = Rps::Play.call(params[:user_throw])
    flash[STATUSES[@result[:status]]] = "You #{@result[:status]}, opponent threw #{@result[:server_throw]}"
    redirect_to root_path
  end
end
