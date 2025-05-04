module StringEnhancer
  module Validator
    class << self
      def valid_email?(str)
        str.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      end

      def valid_url?(str)
        str.match?(%r{\Ahttps?://[^\s/$.?#].[^\s]*\z})
      end

      def valid_phone?(str)
        str.match?(/\A\+?[\d\s\-()]{10,}\z/)
      end

      def valid_date?(str, format: '%Y-%m-%d')
        Date.strptime(str, format) rescue false
      end

      def valid_time?(str)
        str.match?(/\A([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?\z/)
      end

      def valid_ip?(str)
        str.match?(/\A(\d{1,3}\.){3}\d{1,3}\z/)
      end

      def valid_credit_card?(str)
        str.match?(/\A\d{4}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}\z/)
      end

      def valid_hex_color?(str)
        str.match?(/\A#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})\z/)
      end

      def valid_json?(str)
        JSON.parse(str) rescue false
      end

      def valid_xml?(str)
        Nokogiri::XML(str) rescue false
      end
    end
  end
end
