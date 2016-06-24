require 'net/http'

module Line
  module Bot
    class HTTP
      def self.http(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.scheme == "https"
        http
      end

      def self.get(url, header = {})
        uri = URI(url)
        self.http(uri).get(uri.requrest_uri, header)
      end

      def self.post(url, payload, header = {})
        uri = URI(url)
        self.http(uri).post(uri.requrest_uri, payload, header)
      end
    end
  end
end
