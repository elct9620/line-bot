require 'spec_helper'

describe Line::Bot::Response do
  let(:text_message) {
    Line::Bot::Message::Text.new(text: "Test Message")
  }

  let(:message_json) {
    {
      result: [
        {
          from: "u123456",
          eventType: Line::Bot::Receive::EventType::MESSAGE.to_s,
          content: text_message.content
        }
      ]
    }.to_json
  }

  let(:response) {
    Line::Bot::Response.new(message_json)
  }

  it 'should parse json' do
    expect(response).to be_a(Array)
    expect(response.size).to eq(1)
  end

  it 'should define event type' do
    expect(response.first.event_type).not_to be_a(String)
    expect(response.first.event_type).to eq(Line::Bot::Receive::EventType::MESSAGE)
  end

  it 'should have valid event content' do
    expect(response.first.content).to be_valid
  end

end
