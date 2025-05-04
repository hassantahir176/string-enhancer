module StringEnhancer
  module PatternMatcher
    # Predefined patterns for common use cases
    PATTERNS = {
      email: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
      url: %r{\Ahttps?://[^\s/$.?#].[^\s]*\z},
      phone: /\A\+?[\d\s\-()]{10,}\z/,
      date: /\A\d{4}-\d{2}-\d{2}\z/,
      time: /\A([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?\z/,
      ip_address: /\A(\d{1,3}\.){3}\d{1,3}\z/,
      credit_card: /\A\d{4}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}\z/,
      hex_color: /\A#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})\z/
    }.freeze

    def self.match_pattern(str, pattern_name)
      pattern = PATTERNS[pattern_name.to_sym]
      raise PatternMatchError, "Unknown pattern: #{pattern_name}" unless pattern
      
      pattern.match?(str)
    end

    def self.extract_patterns(str)
      matches = {}
      PATTERNS.each do |name, pattern|
        matches[name] = str.scan(pattern)
      end
      matches
    end

    def self.validate_format(str, pattern_name)
      match_pattern(str, pattern_name)
    end

    def self.sanitize(str, pattern_name)
      pattern = PATTERNS[pattern_name.to_sym]
      raise PatternMatchError, "Unknown pattern: #{pattern_name}" unless pattern
      
      str.gsub(pattern, '')
    end
  end
end 