require 'spec_helper'

describe Line::Bot::Event do

 let(:message) {
    Line::Bot::Message::Text.new(text: "Text Message")
 }

  let(:event) {
    Line::Bot::Event.new(
      event_type: Line::Bot::Receive::EventType::MESSAGE,
      data: JSON.parse(message.content.to_json)
    )
  }

  it 'should have event type and content' do
    expect(event).to be_valid
  end

  it 'should parse message event content' do
    expect(event.content).to be_valid
  end

  it 'should parse operation event content'
end
