require 'spec_helper'

describe Line::Bot::API do
  it 'should define API endpoint' do
    expect(Line::Bot::API::ENDPOINT).not_to be_nil
  end

  it 'should define message channel id' do
    expect(Line::Bot::API::MESSAGE_CHANNEL_ID).not_to be_nil
  end
end
