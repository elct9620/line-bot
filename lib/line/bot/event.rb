module Line
  module Bot
    class Event

      attr_reader :event_type, :content

      def initialize(options = {})
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end

        @content = parse_content
      end

      def valid?
        !@event_type.nil? && !@content.nil?
      end

      private

      def parse_content
        case @event_type
        when Receive::EventType::MESSAGE
          return parse_message_data
        when Receive::EventType::OPERATION
          return parse_operation_data
        end
      end

      def parse_message_data
        return if @data.nil?
        case @data['contentType']
        when Message::ContentType::TEXT
           return Message::Text.new(text: @data['text'])
        # TODO: Implement other type message type
        end
      end

      def parse_operation_data
        # TODO: Implement operation content
      end

    end
  end
end

