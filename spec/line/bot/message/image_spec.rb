require 'spec_helper'

describe Line::Bot::Message::Image do
  let(:image) {
    Line::Bot::Message::Image.new(
      image_url: "http://example.com/source.jpg",
      preview_url: "http://example.com/preview.jpg"
    )
  }

  it 'should include image_url and preview_url' do
    expect(image).to be_valid
  end
end
