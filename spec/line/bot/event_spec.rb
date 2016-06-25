require 'spec_helper'

describe Line::Bot::Event do

  def event_from(message)
    Line::Bot::Event.new(
      event_type: Line::Bot::Receive::EventType::MESSAGE,
      data: JSON.parse(message.content.merge(data).to_json),
      from_channel_id: 123456,
      to_channel_id:234567
    )
  end

  let(:text) {
    Line::Bot::Message::Text.new(text: "Text Message")
  }

  let(:image) {
    Line::Bot::Message::Image.new(
      image_url: "http://example.com/image.jpg",
      preview_url: "http://example.com/preview.jpg"
    )
  }

  let(:data) {
    {
      id: 'abc123456',
      to: ['u123456'],
      from: 'u123456'
    }
  }

  let(:event) { event_from(text) }
  let(:image_event) { event_from(image) }

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

  it 'should receive image content' do
    expect(image_event.content).to be_valid
    expect(image_event.content).to be_has_key(:image_url)
    expect(image_event.content).to be_has_key(:preview_url)
  end

  it 'should parse operation event content'
end
