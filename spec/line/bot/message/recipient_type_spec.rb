require 'spec_helper'

describe Line::Bot::Message::RecipientType do
  it 'should define user type' do
    expect(Line::Bot::Message::RecipientType::USER).not_to be_nil
  end
end
