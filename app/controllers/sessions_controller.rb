class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show ]

  def show
    render json: @session, include: :creator
  end

  def create
    @user = User.find_by(email: user_params[:email]) || User.create!(user_params)
    @session = Session.create!(creator: @user, name: session_params[:name])

    if @session.save
      render json: { session: @session, message: "Session created successfully" }, status: :created
    else
      render json: { errors: @session.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def set_session
      @session = Session.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def session_params
      params.require(:session).permit(:name)
    end
end
