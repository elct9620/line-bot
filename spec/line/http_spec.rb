require 'spec_helper'

describe Line::Bot::HTTP do

  it 'should enable SSL for http client' do
    uri = URI('https://example.com/')
    expect(Line::Bot::HTTP.http(uri)).to be_use_ssl
  end

  it 'should get data from remote server'
  it 'should post data to remote server'
end
