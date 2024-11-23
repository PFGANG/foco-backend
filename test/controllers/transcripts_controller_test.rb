require "test_helper"

class TranscriptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transcript = transcripts(:one)
  end

  test "should get index" do
    get transcripts_url, as: :json
    assert_response :success
  end

  test "should create transcript" do
    assert_difference("Transcript.count") do
      post transcripts_url, params: { transcript: { content: @transcript.content, session_id: @transcript.session_id } }, as: :json
    end

    assert_response :created
  end

  test "should show transcript" do
    get transcript_url(@transcript), as: :json
    assert_response :success
  end

  test "should update transcript" do
    patch transcript_url(@transcript), params: { transcript: { content: @transcript.content, session_id: @transcript.session_id } }, as: :json
    assert_response :success
  end

  test "should destroy transcript" do
    assert_difference("Transcript.count", -1) do
      delete transcript_url(@transcript), as: :json
    end

    assert_response :no_content
  end
end
