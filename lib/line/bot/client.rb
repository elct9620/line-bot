module Line
  module Bot
    class Client
      attr_accessor :certentials

      def initialize(options = {})
        @certentials = options if options.is_a?(Certentials)
        @certentials = Certentials.new(options) if options.is_a?(Hash)
        yield(self) if block_given?
      end

    end
  end
end
