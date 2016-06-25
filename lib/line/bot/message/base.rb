module Line
  module Bot
    module Message
      class Base < Hash
        attr_reader :recipient_type

        def initialize(attrs = {})
          self.merge!(attrs)
        end

        def recipient_type
          self[:recipient_type] ||= RecipientType::USER
        end

        def event_type
          Line::Bot::EventType::MESSAGE
        end

        def content
          raise NotImplementedError, "Should implement this method in child class"
        end

        def valid?
          raise NotImplementedError, "Should implement this method in child class"
        end
      end
    end
  end
end
