class ParticipationsController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email]) || User.create!(user_params)
    session = Session.find_by(code: session_params[:code])

    unless session
      return render json: { error: "Session not found" }, status: :not_found
    end

    @participation = Participation.new(
      user: user,
      session: session
    )

    if @participation.save
      render json: @participation, status: :created
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end


  private
    def session_params
      params.require(:session).permit(:code)
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
