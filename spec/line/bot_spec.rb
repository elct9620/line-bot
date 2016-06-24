require 'spec_helper'
require 'line/bot/client'

describe Line::Bot do
  it 'has a version number' do
    expect(Line::Bot::VERSION).not_to be nil
  end
end
