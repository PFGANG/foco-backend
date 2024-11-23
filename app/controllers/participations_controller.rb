class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[ show update destroy ]

  # GET /participations
  def index
    @participations = Participation.all

    render json: @participations
  end

  # GET /participations/1
  def show
    render json: @participation
  end

  # POST /participations
  def create
    # Find or create an anonymous user
    user = User.find_by(email: participation_params[:user_email]) || create_anonymous_user(participation_params[:user_email])

    # Associate the anonymous user with the participation
    @participation = Participation.new(
      user: user,
      session_id: participation_params[:session_id]
    )

    if @participation.save
      render json: @participation, status: :created, location: @participation
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /participations/1
  def update
    if @participation.update(participation_params)
      render json: @participation
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /participations/1
  def destroy
    @participation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participation_params
      params.require(:participation).permit(:user_id, :session_id)
    end

    private


    # Helper to create an anonymous user
    def create_anonymous_user(email)
      User.create(
        name: "Anonymous",
        email: email.presence || generate_random_email
      )
    end

    # Helper to generate a random email for fully anonymous users
    def generate_random_email
      "anonymous_#{SecureRandom.hex(10)}@example.com"
    end
end
