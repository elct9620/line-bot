require 'spec_helper'
require 'line/bot/certentials'

describe Line::Bot::Certentials do

  let (:cert) {
    Line::Bot::Certentials.new(
      channel_id: 123456,
      channel_secret: 'secret',
      channel_mid: 'u1234'
    )
  }

  let (:cert_from_block) {
    Line::Bot::Certentials.new do |config|
      config.channel_id = 123456
      config.channel_secret = 'secret'
      config.channel_mid = 'u1234'
    end
  }

  it 'should setup channel information' do
    expect(cert).to be_valid
  end

  it 'should setup channel information via block' do
    expect(cert_from_block).to be_valid
  end

  it 'should return payload hash' do
    expect(cert.payload.keys).to include('X-Line-ChannelID', 'X-Line-ChannelSecret', 'X-Line-Trusted-User-With-ACL')
  end

  it 'should can check signature' do
    body = "Some data should be hashed"
    signature = "tVuK4fnDBkvzHM89T4uoyRCZvqxk4Pq1bJ1Ph8eioUI="
    expect(cert.validate_signature?(body, signature)).to be_truthy
  end


end
