class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show update destroy ]

  def show
    render json: @session
  end

  def create
    @session = Session.new(session_params) # TODO: Create Participaition

    if @session.save
      render json: @session, status: :created, location: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  private
    def set_session
      @session = Session.find(params[:id])
    end

    def session_params
      params.fetch(:session, {})
    end
end
