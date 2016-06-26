module Line
  module Bot
    class Client
      attr_accessor :certentials

      def initialize(options = {})
        @certentials = options if options.is_a?(Certentials)
        @certentials = Certentials.new(options) if options.is_a?(Hash)
        yield(self) if block_given?
      end

      def get_image(id, preview = false)
        url = "#{API::ENDPOINT}/bot/message/#{id}/content"
        url = "#{url}/preview" if preview
        HTTP.get(url, @certentials.header)
      end

      def send_text(to_mid, message)
        send_message(to_mid, Message::Text.new(text: message))
      end

      def send_image(to_mid, image_url, preview_url)
        send_message(to_mid, Message::Image.new( image_url: image_url, preview_url: preview_url) )
      end

      def send_message(to_mid, message)
        request = Request.new do |config|
          config.to_mid = to_mid
          config.certentials = @certentials
          config.endpoint = API::ENDPOINT
          config.endpoint_path = "/events"
          config.message = message
          config.event_type = Line::Bot::EventType::MESSAGE
        end

        request.post
      end

    end
  end
end
