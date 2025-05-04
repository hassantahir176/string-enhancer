# StringWizard

A magical collection of string manipulation and validation methods that aren't available in Ruby's standard library.

## Features

- Basic string manipulation spells
- Pattern matching and extraction magic
- String validation charms
- Character frequency analysis
- String similarity calculation
- String transformation chains
- Memoization for performance optimization

## Requirements

- Ruby >= 2.6.0

## Dependencies

- nokogiri (for XML validation)
- json (for JSON validation)
- date (for date validation)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_wizard'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install string_wizard

## Usage

### Basic String Spells

```ruby
# Using the wizard
StringWizard.titleize("hello world") # => "Hello World"
StringWizard.remove_vowels("hello world") # => "hll wrld"
StringWizard.palindrome?("madam") # => true

# Using string extensions
"hello world".titleize # => "Hello World"
"hello world".remove_vowels # => "hll wrld"
"madam".palindrome? # => true
```

### String Validation

```ruby
# Email validation
"test@example.com".valid_email? # => true
"invalid-email".valid_email? # => false

# URL validation
"https://example.com".valid_url? # => true
"not-a-url".valid_url? # => false

# Phone number validation
"+1 (555) 123-4567".valid_phone? # => true
"invalid-phone".valid_phone? # => false

# Date validation
"2023-05-15".valid_date? # => true
"2023-05-15".valid_date?(format: '%d/%m/%Y') # => false

# Time validation
"14:30:00".valid_time? # => true
"25:00".valid_time? # => false

# IP address validation
"192.168.1.1".valid_ip? # => true
"256.256.256.256".valid_ip? # => false

# Credit card validation
"4111 1111 1111 1111".valid_credit_card? # => true
"1234".valid_credit_card? # => false

# Hex color validation
"#FF0000".valid_hex_color? # => true
"#ZZZZZZ".valid_hex_color? # => false

# JSON validation
'{"key": "value"}'.valid_json? # => true
'{"key": value}'.valid_json? # => false

# XML validation
'<root><child>value</child></root>'.valid_xml? # => true
'<root><child>value</root>'.valid_xml? # => false
```

### String Analysis

```ruby
# Get detailed string analysis
analysis = "Hello World!".analyze
# => {
#   length: 12,
#   word_count: 2,
#   character_frequency: { "H" => 1, "e" => 1, "l" => 3, "o" => 2, " " => 1, "W" => 1, "r" => 1, "d" => 1, "!" => 1 },
#   vowel_count: 3,
#   consonant_count: 7,
#   digit_count: 0,
#   special_char_count: 1,
#   entropy: 3.0220552088742005,
#   readability_score: 2.890000000000004
# }

# Character frequency analysis
"hello".character_frequency # => { "h" => 1, "e" => 1, "l" => 2, "o" => 1 }

# Clear memoization cache
StringWizard.clear_cache
```

### Pattern Matching

```ruby
# Match patterns with named captures
pattern = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/
result = "2023-05-15".match_pattern(pattern)
# => { "year" => "2023", "month" => "05", "day" => "15" }

# Check if string matches a predefined pattern
"test@example.com".matches_pattern?(:email) # => true
"not-an-email".matches_pattern?(:email) # => false

# Extract all patterns from a string
text = "Contact me at test@example.com or visit https://example.com"
text.extract_patterns
# => {
#   email: ["test@example.com"],
#   url: ["https://example.com"],
#   phone: [],
#   date: [],
#   time: [],
#   ip_address: [],
#   credit_card: [],
#   hex_color: []
# }

# Sanitize string by removing specific patterns
text = "My email is test@example.com and phone is +1234567890"
text.sanitize(:email) # => "My email is  and phone is +1234567890"

# Predefined patterns available:
# - :email
# - :url
# - :phone
# - :date
# - :time
# - :ip_address
# - :credit_card
# - :hex_color
```

### String Transformation Chain

```ruby
# Chain multiple transformations
result = "hello world".transform
  .titleize
  .upcase
  .remove_vowels
  .apply
# => "HLL WRLD"

# Available transformations:
# - :titleize
# - :upcase
# - :downcase
# - :reverse
# - :strip
# - :remove_vowels
# - :remove_consonants
# - :alternating_case
# - :reverse_words
```

### String Similarity

```ruby
# Calculate string similarity using Levenshtein distance
"hello".similarity("hell") # => 0.8
"hello".similarity("world") # => 0.2
```

## Performance Considerations

- Character frequency analysis is memoized for better performance
- Use `clear_cache` to free up memory when needed
- Pattern matching operations are optimized for common use cases

## Error Handling

The gem defines several custom error classes:
- `StringWizard::Error` - Base error class
- `StringWizard::PatternMatchError` - Raised when pattern matching fails
- `StringWizard::EncryptionError` - Raised when encryption/decryption fails

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hassantahir176/string_wizard.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT). 