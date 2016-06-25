require 'spec_helper'

describe Line::Bot::Request do
  let(:cert) {
    Line::Bot::Certentials.new(
      channel_id: 123456,
      channel_secret: 'secret',
      channel_mid: 'u1234'
    )
  }
  let(:request) {
    Line::Bot::Request.new do |config|
      config.certentials = cert
      config.endpoint = "https://example.com/v1"
      config.endpoint_path = "/events"
      config.to_mid = "user1234"
      config.message = text_message
      config.event_type = Line::Bot::EventType::MESSAGE
    end
  }
  let(:text_message) {
    Line::Bot::Message::Text.new(text: "Test Message")
  }

  it 'should have valid header' do
    expect(request.header.keys).to include('Content-Type', 'X-Line-ChannelID', 'X-Line-ChannelSecret', 'X-Line-Trusted-User-With-ACL')
  end

  it 'should let receiver as array' do
    request.to_mid = "user1234"
    expect(request.to).to eq(["user1234"])
  end

  it 'should generate text message payload' do
    payload = {
      to: request.to,
      toChannel: Line::Bot::API::MESSAGE_CHANNEL_ID,
      eventType: Line::Bot::EventType::MESSAGE.to_s,
      content: {
        contentType: Line::Bot::Message::ContentType::TEXT,
        toType: Line::Bot::Message::RecipientType::USER,
        text: "Test Message"
        }
    }.to_json

    expect(request.payload).to eq(payload)
  end

  it 'should get data from remote server'
  it 'should post data to remote server'
end
