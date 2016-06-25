require 'spec_helper'

describe Line::Bot::Client do
  let(:cert) {
    Line::Bot::Certentials.new(
      channel_id: 123456,
      channel_secret: 'secret',
      channel_mid: 'u1234'
    )
  }

  let(:client) { Line::Bot::Client.new(cert) }
  let(:client_raw) {
    Line::Bot::Client.new(
      channel_id: 123456,
      channel_secret: 'secret',
      channel_mid: 'u1234'
    )
  }
  let(:client_from_block) {
    Line::Bot::Client.new do |config|
      config.certentials = cert
    end
  }

  it 'should support setup cert' do
    expect(client.certentials).to eq(cert)
  end

  it 'should has valid certentials created from channel information' do
    expect(client_raw.certentials).to be_valid
  end

  it 'should has valid cert created fom block' do
    expect(client_from_block.certentials).to eq(cert)
  end

  it 'should send text message to api server'
end
