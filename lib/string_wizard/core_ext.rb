class String
  # Returns a string with the first letter of each word capitalized
  def titleize
    StringWizard.titleize(self)
  end

  # Returns a string with all vowels removed
  def remove_vowels
    StringWizard.remove_vowels(self)
  end

  # Returns a string with all consonants removed
  def remove_consonants
    StringWizard.remove_consonants(self)
  end

  # Returns true if the string is a palindrome
  def palindrome?
    StringWizard.palindrome?(self)
  end

  # Returns a string with alternating case
  def alternating_case
    StringWizard.alternating_case(self)
  end

  # Returns a string with words in reverse order
  def reverse_words
    StringWizard.reverse_words(self)
  end

  # Advanced string analysis
  def analyze
    StringWizard.analyze(self)
  end

  # Pattern matching
  def match_pattern(pattern)
    StringWizard.match_pattern(self, pattern)
  end

  def matches_pattern?(pattern_name)
    StringWizard::PatternMatcher.match_pattern(self, pattern_name)
  end

  def extract_patterns
    StringWizard::PatternMatcher.extract_patterns(self)
  end

  def validate_format(pattern_name)
    StringWizard::PatternMatcher.validate_format(self, pattern_name)
  end

  def sanitize(pattern_name)
    StringWizard::PatternMatcher.sanitize(self, pattern_name)
  end

  # String transformation chain
  def transform
    StringWizard::Transformer.transform(self)
  end

  # String similarity
  def similarity(other)
    StringWizard.similarity(self, other)
  end

  # Parallel processing
  def self.process_batch(strings, batch_size: 100, &block)
    StringWizard.process_batch(strings, batch_size: batch_size, &block)
  end

  def self.analyze_batch(strings, batch_size: 100)
    StringWizard.analyze_batch(strings, batch_size: batch_size)
  end

  def self.transform_batch(strings, transformations, batch_size: 100)
    StringWizard.transform_batch(strings, transformations, batch_size: batch_size)
  end

  def self.similarity_matrix(strings, batch_size: 100)
    StringWizard.similarity_matrix(strings, batch_size: batch_size)
  end

  # Encryption
  def encrypt(key, algorithm: 'AES-256-CBC')
    StringWizard.encrypt(self, key, algorithm: algorithm)
  end

  def self.decrypt(encrypted_str, key, algorithm: 'AES-256-CBC')
    StringWizard.decrypt(encrypted_str, key, algorithm: algorithm)
  end

  def hash(algorithm: :sha256)
    StringWizard.hash(self, algorithm: algorithm)
  end

  def secure_compare(other)
    StringWizard.secure_compare(self, other)
  end

  # Fuzzy matching
  def fuzzy_match(candidates, threshold: 0.8)
    StringWizard.fuzzy_match(self, candidates, threshold: threshold)
  end

  def best_match(candidates, threshold: 0.8)
    StringWizard.best_match(self, candidates, threshold: threshold)
  end

  # Validation methods
  def valid_email?
    StringWizard.valid_email?(self)
  end

  def valid_url?
    StringWizard.valid_url?(self)
  end

  def valid_phone?
    StringWizard.valid_phone?(self)
  end

  def valid_date?(format: '%Y-%m-%d')
    StringWizard.valid_date?(self, format: format)
  end

  def valid_time?
    StringWizard.valid_time?(self)
  end

  def valid_ip?
    StringWizard.valid_ip?(self)
  end

  def valid_credit_card?
    StringWizard.valid_credit_card?(self)
  end

  def valid_hex_color?
    StringWizard.valid_hex_color?(self)
  end

  def valid_json?
    StringWizard.valid_json?(self)
  end

  def valid_xml?
    StringWizard.valid_xml?(self)
  end

  # Clear memoization cache
  def self.clear_cache
    StringWizard.clear_cache
  end
end 