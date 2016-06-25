# Line Bot Lite

[![Rubygems](https://img.shields.io/gem/v/line-bot-lite.svg)](https://rubygems.org/gems/line-bot-lite)
[![Build Status](https://travis-ci.org/elct9620/line-bot.svg?branch=master)](https://travis-ci.org/elct9620/line-bot)
[![Coverage Status](https://coveralls.io/repos/github/elct9620/line-bot/badge.svg?branch=master)](https://coveralls.io/github/elct9620/line-bot?branch=master)
[![Code Climate](https://codeclimate.com/github/elct9620/line-bot/badges/gpa.svg)](https://codeclimate.com/github/elct9620/line-bot)

Yet another line bot SDK implement. This version use all ruby builtin library and without dependencies problem like `rack` version is lock down to `>= 0`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'line-bot-lite'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install line-bot-lite

## Usage

Current only implemented `send_text` method, and still need refactor to support all types message.

```ruby
require 'line/bot'
require 'json'

def client
  @client ||= Line::Bot::Client.new(
    channel_id: ENV['LINE_CHANNEL_ID'],
    channel_secret: ENV['LINE_CHANNEL_SECRET'],
    channel_mid: ENV['LINE_CHANNEL_MID']
  )
end

post '/callback' do
  signature = request.env['HTTP_X_LINE_CHANNELSIGNATURE']
  unless client.certentials.validate_signature(request.body.read, signature)
    error 400 do 'Bad Request' end
  end

  request.body.rewind
  events = Line::Bot::Response.new(request.body.read)

  events.each do |event|
    case event.event_type
    when Line::Bot::Receive::EventType::MESSAGE
      client.send_text(event.from_mid, event.content[:text])
    end
  end

  "OK"
end
```

WARNING: The API will changed until it stable, and next release will provide response parser helper.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elct9620/line-bot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

