require "string_enhancer/version"
require "string_enhancer/core_ext"
require "string_enhancer/pattern_matcher"
require "string_enhancer/transformer"
require "string_enhancer/encryption"
require "json"
require "nokogiri"
require "date"

module StringEnhancer
  class Error < StandardError; end
  class PatternMatchError < Error; end
  class EncryptionError < Error; end

  # Memoization cache for expensive operations
  @memo_cache = {}

  class << self
    # Basic string operations
    def titleize(str)
      str.split.map(&:capitalize).join(' ')
    end

    def remove_vowels(str)
      str.gsub(/[aeiouAEIOU]/, '')
    end

    def remove_consonants(str)
      str.gsub(/[^aeiouAEIOU\s]/, '')
    end

    def palindrome?(str)
      normalized = str.downcase.gsub(/[^a-z0-9]/, '')
      normalized == normalized.reverse
    end

    def alternating_case(str)
      str.chars.each_with_index.map do |char, index|
        index.even? ? char.upcase : char.downcase
      end.join
    end

    def reverse_words(str)
      str.split.reverse.join(' ')
    end

    # Advanced string analysis
    def analyze(str)
      {
        length: str.length,
        word_count: str.split.size,
        character_frequency: character_frequency(str),
        vowel_count: str.scan(/[aeiouAEIOU]/).size,
        consonant_count: str.scan(/[^aeiouAEIOU\s\W]/).size,
        digit_count: str.scan(/\d/).size,
        special_char_count: str.scan(/[^a-zA-Z0-9\s]/).size,
        entropy: calculate_entropy(str),
        readability_score: calculate_readability(str)
      }
    end

    # Pattern matching
    def match_pattern(str, pattern)
      regex = pattern.is_a?(Regexp) ? pattern : Regexp.new(pattern)
      match = regex.match(str)
      return nil unless match

      if match.named_captures.any?
        match.named_captures
      else
        match.captures
      end
    end

    # String transformation chain
    def transform(str, *transformations)
      transformations.inject(str) do |result, transformation|
        case transformation
        when :titleize then titleize(result)
        when :upcase then result.upcase
        when :downcase then result.downcase
        when :reverse then result.reverse
        when :strip then result.strip
        when :remove_vowels then remove_vowels(result)
        when :remove_consonants then remove_consonants(result)
        when :alternating_case then alternating_case(result)
        when :reverse_words then reverse_words(result)
        else
          raise Error, "Unknown transformation: #{transformation}"
        end
      end
    end

    # Memoized character frequency analysis
    def character_frequency(str)
      @memo_cache["frequency_#{str}"] ||= begin
        frequency = Hash.new(0)
        str.each_char { |char| frequency[char] += 1 }
        frequency
      end
    end

    # Clear memoization cache
    def clear_cache
      @memo_cache.clear
    end

    # String similarity methods
    def similarity(str1, str2)
      return 1.0 if str1 == str2
      return 0.0 if str1.empty? || str2.empty?

      # Calculate Levenshtein distance
      distance = levenshtein_distance(str1, str2)
      max_length = [str1.length, str2.length].max
      1.0 - (distance.to_f / max_length)
    end

    # Encryption
    def encrypt(str, key, algorithm: 'AES-256-CBC')
      Encryption.encrypt(str, key, algorithm: algorithm)
    end

    def decrypt(encrypted_str, key, algorithm: 'AES-256-CBC')
      Encryption.decrypt(encrypted_str, key, algorithm: algorithm)
    end

    def hash(str, algorithm: :sha256)
      Encryption.hash(str, algorithm: algorithm)
    end

    def secure_compare(str1, str2)
      Encryption.secure_compare(str1, str2)
    end

    # String validation
    def valid_email?(str)
      str.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
    end

    def valid_url?(str)
      str.match?(/\Ahttps?:\/\/[\w\-]+(\.[\w\-]+)+[\/#?]?.*\z/i)
    end

    def valid_phone?(str)
      str.match?(/\A\+?[\d\s\-()]+\z/)
    end

    def valid_date?(str, format: '%Y-%m-%d')
      Date.strptime(str, format)
      true
    rescue Date::Error
      false
    end

    def valid_time?(str)
      str.match?(/\A([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?\z/)
    end

    def valid_ip?(str)
      str.match?(/\A(\d{1,3}\.){3}\d{1,3}\z/) &&
        str.split('.').all? { |octet| octet.to_i.between?(0, 255) }
    end

    def valid_credit_card?(str)
      # Remove all non-digit characters
      digits = str.gsub(/\D/, '').chars.map(&:to_i)
      return false if digits.empty?

      # Luhn algorithm
      sum = 0
      digits.reverse.each_with_index do |digit, index|
        if index.odd?
          doubled = digit * 2
          sum += doubled > 9 ? doubled - 9 : doubled
        else
          sum += digit
        end
      end

      (sum % 10).zero?
    end

    def valid_hex_color?(str)
      str.match?(/\A#[0-9A-Fa-f]{6}\z/)
    end

    def valid_json?(str)
      JSON.parse(str)
      true
    rescue JSON::ParserError
      false
    end

    def valid_xml?(str)
      Nokogiri::XML(str) { |config| config.strict }
      true
    rescue Nokogiri::XML::SyntaxError
      false
    end

    private

    # Levenshtein distance calculation
    def levenshtein_distance(str1, str2)
      m = str1.length
      n = str2.length
      return m if n == 0
      return n if m == 0

      d = Array.new(m + 1) { Array.new(n + 1) }

      (0..m).each { |i| d[i][0] = i }
      (0..n).each { |j| d[0][j] = j }

      (1..m).each do |i|
        (1..n).each do |j|
          cost = str1[i - 1] == str2[j - 1] ? 0 : 1
          d[i][j] = [
            d[i - 1][j] + 1,     # deletion
            d[i][j - 1] + 1,     # insertion
            d[i - 1][j - 1] + cost # substitution
          ].min
        end
      end

      d[m][n]
    end

    # Calculate string entropy
    def calculate_entropy(str)
      return 0.0 if str.empty?

      frequency = character_frequency(str)
      length = str.length.to_f

      -frequency.values.sum do |count|
        probability = count / length
        probability * Math.log2(probability)
      end
    end

    # Calculate readability score
    def calculate_readability(str)
      words = str.split
      sentences = str.split(/[.!?]+/)
      syllables = words.sum { |word| count_syllables(word) }

      return 0.0 if words.empty? || sentences.empty?

      # Flesch-Kincaid Grade Level
      (0.39 * (words.size / sentences.size.to_f)) +
        (11.8 * (syllables / words.size.to_f)) - 15.59
    end

    # Count syllables in a word
    def count_syllables(word)
      word.downcase.gsub(/[^a-z]/, '').scan(/[aeiouy]+/).size
    end
  end
end 