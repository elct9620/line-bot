# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'line/bot/version'

Gem::Specification.new do |spec|
  spec.name          = "line-bot-lite"
  spec.version       = Line::Bot::VERSION
  spec.authors       = ["蒼時弦也"]
  spec.email         = ["contact@frost.tw"]

  spec.summary       = %q{ Line Bot API implemented use Ruby builtin library }
  spec.description   = %q{ Line Bot API usuall depend on rack but it cause newer rack cannot working correctly, so I create yet another library for it. }
  spec.homepage      = "https://github.com/elct9620/line-bot"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "fuubar", "~> 2.0"
  spec.add_development_dependency "coveralls", "~> 0.8"
end
