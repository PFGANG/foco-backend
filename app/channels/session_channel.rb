class SessionChannel < ApplicationCable::Channel
    def subscribed
        session = Session.find(params[:room])
        stream_for session
    end

    def receive(data)
        session = Session.find(params[:room])
        transcript = session.transcripts.create!(content: data["content"], partial: data["partial"])

        SessionChannel.broadcast_to(session, transcript:)
    end

    private
end
  