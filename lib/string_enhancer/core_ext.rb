class String
  # Returns a string with the first letter of each word capitalized
  def titleize
    StringEnhancer.titleize(self)
  end

  # Returns a string with all vowels removed
  def remove_vowels
    StringEnhancer.remove_vowels(self)
  end

  # Returns a string with all consonants removed
  def remove_consonants
    StringEnhancer.remove_consonants(self)
  end

  # Returns true if the string is a palindrome
  def palindrome?
    StringEnhancer.palindrome?(self)
  end

  # Returns a string with alternating case
  def alternating_case
    StringEnhancer.alternating_case(self)
  end

  # Returns a string with words in reverse order
  def reverse_words
    StringEnhancer.reverse_words(self)
  end

  # Advanced string analysis
  def analyze
    StringEnhancer.analyze(self)
  end

  # Pattern matching
  def match_pattern(pattern)
    StringEnhancer.match_pattern(self, pattern)
  end

  def matches_pattern?(pattern_name)
    StringEnhancer::PatternMatcher.match_pattern(self, pattern_name)
  end

  def extract_patterns
    StringEnhancer::PatternMatcher.extract_patterns(self)
  end

  def validate_format(pattern_name)
    StringEnhancer::PatternMatcher.validate_format(self, pattern_name)
  end

  def sanitize(pattern_name)
    StringEnhancer::PatternMatcher.sanitize(self, pattern_name)
  end

  # String transformation chain
  def transform
    StringEnhancer::Transformer.transform(self)
  end

  # String similarity
  def similarity(other)
    StringEnhancer.similarity(self, other)
  end

  # Parallel processing
  def self.process_batch(strings, batch_size: 100, &block)
    StringEnhancer.process_batch(strings, batch_size: batch_size, &block)
  end

  def self.analyze_batch(strings, batch_size: 100)
    StringEnhancer.analyze_batch(strings, batch_size: batch_size)
  end

  def self.transform_batch(strings, transformations, batch_size: 100)
    StringEnhancer.transform_batch(strings, transformations, batch_size: batch_size)
  end

  def self.similarity_matrix(strings, batch_size: 100)
    StringEnhancer.similarity_matrix(strings, batch_size: batch_size)
  end

  # Encryption
  def encrypt(key, algorithm: 'AES-256-CBC')
    StringEnhancer.encrypt(self, key, algorithm: algorithm)
  end

  def self.decrypt(encrypted_str, key, algorithm: 'AES-256-CBC')
    StringEnhancer.decrypt(encrypted_str, key, algorithm: algorithm)
  end

  def hash(algorithm: :sha256)
    StringEnhancer.hash(self, algorithm: algorithm)
  end

  def secure_compare(other)
    StringEnhancer.secure_compare(self, other)
  end

  # Fuzzy matching
  def fuzzy_match(candidates, threshold: 0.8)
    StringEnhancer.fuzzy_match(self, candidates, threshold: threshold)
  end

  def best_match(candidates, threshold: 0.8)
    StringEnhancer.best_match(self, candidates, threshold: threshold)
  end

  # Validation methods
  def valid_email?
    StringEnhancer.valid_email?(self)
  end

  def valid_url?
    StringEnhancer.valid_url?(self)
  end

  def valid_phone?
    StringEnhancer.valid_phone?(self)
  end

  def valid_date?(format: '%Y-%m-%d')
    StringEnhancer.valid_date?(self, format: format)
  end

  def valid_time?
    StringEnhancer.valid_time?(self)
  end

  def valid_ip?
    StringEnhancer.valid_ip?(self)
  end

  def valid_credit_card?
    StringEnhancer.valid_credit_card?(self)
  end

  def valid_hex_color?
    StringEnhancer.valid_hex_color?(self)
  end

  def valid_json?
    StringEnhancer.valid_json?(self)
  end

  def valid_xml?
    StringEnhancer.valid_xml?(self)
  end

  # Clear memoization cache
  def self.clear_cache
    StringEnhancer.clear_cache
  end
end 