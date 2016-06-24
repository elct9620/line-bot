require 'net/http'

module Line
  module Bot
    class HTTP
      def http(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.scheme == "https"
        http
      end

      def get(url, header = {})
        uri = URI(url)
        http(uri).get(uri.requrest_uri, header)
      end

      def post(url, payload, header = {})
        uri = URI(url)
        http(uri).post(uri.requrest_uri, payload, header)
      end
    end
  end
end
