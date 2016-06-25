require 'spec_helper'

describe Line::Bot::Message::Text do

  let(:message) {
    Line::Bot::Message::Text.new(text: "Hello World")
  }

  it 'should have text inside content' do
    expect(message.content).to be_has_key(:text)
    expect(message.content.values).to include("Hello World")
  end

  it 'should have valid content' do
    expect(message).to be_valid
  end
end
