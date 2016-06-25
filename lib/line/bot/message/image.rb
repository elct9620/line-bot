module Line
  module Bot
    module Message
      class Image < Base
        attr_reader :image_url, :preview_url

        def content
          {
            contentType: ContentType::IMAGE,
            toType: recipient_type,
            originalContentUrl: self[:image_url],
            previewImageUrl: self[:preview_url]
          }
        end

        def valid?
          !self[:image_url].nil? && ![:preview_url].nil?
        end
      end
    end
  end
end
