require 'spec_helper'

describe Line::Bot::EventType do
  it 'should define message event' do
    expect(Line::Bot::EventType::MESSAGE).not_to be_nil
  end

  it 'should define multiple message event' do
    expect(Line::Bot::EventType::MULTIPLE_MESSAGE).not_to be_nil
  end
end

describe Line::Bot::Receive::EventType do
  it 'should define message event' do
    expect(Line::Bot::Receive::EventType::MESSAGE).not_to be_nil
  end

  it 'should define operation event' do
    expect(Line::Bot::Receive::EventType::OPERATION).not_to be_nil
  end
end
