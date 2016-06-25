require 'spec_helper'

describe Line::Bot::Message::Base do

  let(:message) {
    Line::Bot::Message::Base.new(
      text: "Hello World"
    )
  }

  it 'should have default recipient type' do
    expect(message.recipient_type).to eq(Line::Bot::Message::RecipientType::USER)
  end

  it 'should work like hash' do
    expect(message).to be_has_key(:text)
    expect(message.values).to include("Hello World")
  end

  it 'should have message event type' do
    expect(message.event_type).to eq(Line::Bot::EventType::MESSAGE)
  end

  it 'should raise error when call content' do
    expect{message.content}.to raise_error(NotImplementedError)
  end

  it 'should raise error when call valid?' do
    expect{message.valid?}.to raise_error(NotImplementedError)
  end

end
