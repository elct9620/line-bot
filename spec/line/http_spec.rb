require 'spec_helper'

describe Line::Bot::HTTP do

  let(:http) { Line::Bot::HTTP.new }

  it 'should enable SSL for http client' do
    uri = URI('https://example.com/')
    expect(http.http(uri)).to be_use_ssl
  end

  it 'should get data from remote server'
  it 'should post data to remote server'
end
