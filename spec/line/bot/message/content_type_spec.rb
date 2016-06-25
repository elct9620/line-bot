require 'spec_helper'

describe Line::Bot::Message::ContentType do
  it 'should define text type' do
    expect(Line::Bot::Message::ContentType::TEXT).not_to be_nil
  end

  it 'should define image type' do
    expect(Line::Bot::Message::ContentType::IMAGE).not_to be_nil
  end

  it 'should define video type' do
    expect(Line::Bot::Message::ContentType::VIDEO).not_to be_nil
  end

  it 'should define audio type' do
    expect(Line::Bot::Message::ContentType::AUDIO).not_to be_nil
  end

  it 'should define location type' do
    expect(Line::Bot::Message::ContentType::LOCATION).not_to be_nil
  end

  it 'should define sticker type' do
    expect(Line::Bot::Message::ContentType::STICKER).not_to be_nil
  end

  it 'should define contact type' do
    expect(Line::Bot::Message::ContentType::CONTACT).not_to be_nil
  end

  it 'should define rich message type' do
    expect(Line::Bot::Message::ContentType::RICH_MESSAGE).not_to be_nil
  end
end
