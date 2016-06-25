module Line
  module Bot
    module Message
      class Text < Base
        def content
          {
            contentType: ContentType::TEXT,
            toType: recipient_type,
            text: self[:text]
          }
        end

        def valid?
          !self[:text].nil?
        end
      end
    end
  end
end
