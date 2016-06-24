module Line
  module Bot
    class Request

      attr_accessor :to_mid, :message, :certentials, :endpoint, :endpoint_path

      def initialize
        yield(self) if block_given?
      end

      def to
        to_mid.is_a?(String) ? [to_mid] : to_mid
      end

      def payload
        {
          to: to,
          toChannel: API::MESSAGE_CHANNEL_ID, # Fixed value
          eventType: "138311608800106203",
          content: {
            contentType: 1,
            toType: 1,
            text: message
          }

        }.to_json
      end

      def header
        header = {
          'Content-Type' => 'application/json; charset=UTF-8',
          'User-Agent' => "Line-Bot-Lite/#{Line::Bot::VERSION}"
        }
        return header if certentials.nil?
        hash = certentials.payload.inject({}) { |h, (k, v)| h[k] = v.to_s; h }

        header.merge(hash)
      end

      def get
        HTTP.get(endpoint + endpoint_path, header)
      end

      def post
        HTTP.post(endpoint + endpoint_path, payload, header)
      end

    end
  end
end
