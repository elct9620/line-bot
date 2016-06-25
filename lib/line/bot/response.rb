require 'json'

module Line
  module Bot
    class Response < Array
      def initialize(data = "")
        json = JSON.parse(data)
        self.concat(json['result'])
        parse_event
      end

      private

      def parse_event
        self.map! do |event|
          create_event(event)
        end
      end

      def create_event(event_data)
        case event_data['eventType'].to_i
        when Receive::EventType::MESSAGE
          type =  Receive::EventType::MESSAGE
        when Receive::EventType::OPERATION
          type = Receive::EventType::OPERATION
        end

        Event.new(
          event_type: type,
          data: event_data['content'],
          from_channel_id: event_data['fromChannel'],
          to_channel_id: event_data['toChannel']
        )
      end
    end
  end
end
