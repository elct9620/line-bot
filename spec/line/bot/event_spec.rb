require 'spec_helper'

describe Line::Bot::Event do

  let(:message) {
    Line::Bot::Message::Text.new(text: "Text Message")
  }

  let(:data) {
    message.content.merge({
      id: 'abc123456',
      to: ['u123456'],
      from: 'u123456'
    }).to_json
  }

  let(:event) {
    Line::Bot::Event.new(
      event_type: Line::Bot::Receive::EventType::MESSAGE,
      data: JSON.parse(data),
      from_channel_id: 123456,
      to_channel_id:234567
    )
  }

  it 'should have event type and content' do
    expect(event).to be_valid
  end

  it 'should parse message event content' do
    expect(event.content).to be_valid
  end

  it 'should has message id' do
    expect(event.id).not_to be_nil
  end

  it 'should has message from_mid' do
    expect(event.from_mid).not_to be_nil
  end

  it 'should has message to_mid' do
    expect(event.to_mid).not_to be_nil
  end

  it 'should has message from_channel_id' do
    expect(event.from_channel_id).not_to be_nil
  end

  it 'should has message to_channel_id' do
    expect(event.to_channel_id).not_to be_nil
  end

  it 'should parse operation event content'
end
