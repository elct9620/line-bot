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
      config.to_channel_id = 1383378250
      config.message = "Test Message"
    end
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
      toChannel: 1383378250,
      eventType: "138311608800106203",
      content: {
        contentType: 1,
        toType: 1,
        text: "Test Message"
        }
    }.to_json

    expect(request.payload).to eq(payload)
  end

  it 'should get data from remote server'
  it 'should post data to remote server'
end
