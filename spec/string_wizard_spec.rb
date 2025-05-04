require "spec_helper"

RSpec.describe StringWizard do
  describe "Basic String Operations" do
    describe ".titleize" do
      it "capitalizes the first letter of each word" do
        expect(StringWizard.titleize("hello world")).to eq("Hello World")
        expect(StringWizard.titleize("ruby on rails")).to eq("Ruby On Rails")
      end
    end

    describe ".remove_vowels" do
      it "removes all vowels from the string" do
        expect(StringWizard.remove_vowels("hello world")).to eq("hll wrld")
        expect(StringWizard.remove_vowels("ruby on rails")).to eq("rby n rls")
      end
    end

    describe ".remove_consonants" do
      it "removes all consonants from the string" do
        expect(StringWizard.remove_consonants("hello world")).to eq("eo o")
        expect(StringWizard.remove_consonants("ruby on rails")).to eq("u o ai")
      end
    end

    describe ".palindrome?" do
      it "returns true for palindromes" do
        expect(StringWizard.palindrome?("madam")).to be true
        expect(StringWizard.palindrome?("A man, a plan, a canal: Panama")).to be true
      end

      it "returns false for non-palindromes" do
        expect(StringWizard.palindrome?("hello")).to be false
        expect(StringWizard.palindrome?("ruby")).to be false
      end
    end

    describe ".alternating_case" do
      it "alternates between uppercase and lowercase" do
        expect(StringWizard.alternating_case("hello")).to eq("HeLlO")
        expect(StringWizard.alternating_case("ruby")).to eq("RuBy")
      end
    end

    describe ".reverse_words" do
      it "reverses the order of words" do
        expect(StringWizard.reverse_words("hello world")).to eq("world hello")
        expect(StringWizard.reverse_words("ruby on rails")).to eq("rails on ruby")
      end
    end
  end

  describe "String Analysis" do
    describe ".analyze" do
      it "returns detailed string analysis" do
        analysis = StringWizard.analyze("Hello World!")
        expect(analysis).to include(
          length: 12,
          word_count: 2,
          vowel_count: 3,
          consonant_count: 7,
          digit_count: 0,
          special_char_count: 1
        )
        expect(analysis[:character_frequency]).to include(
          'H' => 1,
          'e' => 1,
          'l' => 3,
          'o' => 2,
          ' ' => 1,
          'W' => 1,
          'r' => 1,
          'd' => 1,
          '!' => 1
        )
      end

      it "handles empty strings" do
        analysis = StringWizard.analyze("")
        expect(analysis).to include(
          length: 0,
          word_count: 0,
          vowel_count: 0,
          consonant_count: 0,
          digit_count: 0,
          special_char_count: 0
        )
      end

      it "handles strings with numbers" do
        analysis = StringWizard.analyze("123 abc 456")
        expect(analysis).to include(
          digit_count: 6,
          word_count: 3
        )
      end
    end
  end

  describe "Pattern Matching" do
    describe ".match_pattern" do
      it "matches patterns with named captures" do
        pattern = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/
        result = StringWizard.match_pattern("2023-05-15", pattern)
        expect(result).to eq({
          "year" => "2023",
          "month" => "05",
          "day" => "15"
        })
      end
    end
  end

  describe "String Validation" do
    describe ".valid_email?" do
      it "validates email addresses" do
        expect(StringWizard.valid_email?("test@example.com")).to be true
        expect(StringWizard.valid_email?("invalid-email")).to be false
      end

      it "validates different email formats" do
        expect(StringWizard.valid_email?("test@example.com")).to be true
        expect(StringWizard.valid_email?("test.name@example.com")).to be true
        expect(StringWizard.valid_email?("test+label@example.com")).to be true
        expect(StringWizard.valid_email?("test@sub.example.com")).to be true
        expect(StringWizard.valid_email?("test@example.co.uk")).to be true
        expect(StringWizard.valid_email?("invalid-email")).to be false
        expect(StringWizard.valid_email?("test@")).to be false
        expect(StringWizard.valid_email?("@example.com")).to be false
      end
    end

    describe ".valid_url?" do
      it "validates URLs" do
        expect(StringWizard.valid_url?("https://example.com")).to be true
        expect(StringWizard.valid_url?("not-a-url")).to be false
      end

      it "validates different URL formats" do
        expect(StringWizard.valid_url?("https://example.com")).to be true
        expect(StringWizard.valid_url?("http://example.com")).to be true
        expect(StringWizard.valid_url?("https://sub.example.com/path?query=value")).to be true
        expect(StringWizard.valid_url?("https://example.com:8080")).to be true
        expect(StringWizard.valid_url?("ftp://example.com")).to be false
        expect(StringWizard.valid_url?("not-a-url")).to be false
      end
    end

    describe ".valid_phone?" do
      it "validates phone numbers" do
        expect(StringWizard.valid_phone?("+1 (555) 123-4567")).to be true
        expect(StringWizard.valid_phone?("invalid-phone")).to be false
      end
    end

    describe ".valid_date?" do
      it "validates dates" do
        expect(StringWizard.valid_date?("2023-05-15")).to be true
        expect(StringWizard.valid_date?("2023-05-15", format: '%d/%m/%Y')).to be false
      end
    end

    describe ".valid_time?" do
      it "validates times" do
        expect(StringWizard.valid_time?("14:30:00")).to be true
        expect(StringWizard.valid_time?("25:00")).to be false
      end
    end

    describe ".valid_ip?" do
      it "validates IP addresses" do
        expect(StringWizard.valid_ip?("192.168.1.1")).to be true
        expect(StringWizard.valid_ip?("256.256.256.256")).to be false
      end
    end

    describe ".valid_credit_card?" do
      it "validates credit card numbers" do
        expect(StringWizard.valid_credit_card?("4111 1111 1111 1111")).to be true
        expect(StringWizard.valid_credit_card?("1234")).to be false
      end

      it "validates different credit card formats" do
        expect(StringWizard.valid_credit_card?("4111 1111 1111 1111")).to be true  # Visa
        expect(StringWizard.valid_credit_card?("5500 0000 0000 0004")).to be true  # Mastercard
        expect(StringWizard.valid_credit_card?("3400 0000 0000 009")).to be true   # Amex
        expect(StringWizard.valid_credit_card?("6011 0000 0000 0004")).to be true  # Discover
      end

      it "rejects invalid credit card numbers" do
        expect(StringWizard.valid_credit_card?("1234")).to be false
        expect(StringWizard.valid_credit_card?("4111 1111 1111 1112")).to be false
        expect(StringWizard.valid_credit_card?("not a number")).to be false
        expect(StringWizard.valid_credit_card?("")).to be false
      end
    end

    describe ".valid_hex_color?" do
      it "validates hex colors" do
        expect(StringWizard.valid_hex_color?("#FF0000")).to be true
        expect(StringWizard.valid_hex_color?("#ZZZZZZ")).to be false
      end
    end

    describe ".valid_json?" do
      it "validates JSON strings" do
        expect(StringWizard.valid_json?('{"key": "value"}')).to be true
        expect(StringWizard.valid_json?('{"key": value}')).to be false
      end
    end

    describe ".valid_xml?" do
      it "validates XML strings" do
        expect(StringWizard.valid_xml?('<root><child>value</child></root>')).to be true
        expect(StringWizard.valid_xml?('<root><child>value</root>')).to be false
      end
    end
  end

  describe "String Similarity" do
    describe ".similarity" do
      it "calculates string similarity" do
        expect(StringWizard.similarity("hello", "hello")).to eq(1.0)
        expect(StringWizard.similarity("hello", "hell")).to be > 0.5
        expect(StringWizard.similarity("hello", "world")).to be < 0.5
      end
    end
  end

  describe "String Transformation" do
    describe ".transform" do
      it "applies multiple transformations in sequence" do
        result = StringWizard.transform("hello world", :titleize, :upcase)
        expect(result).to eq("HELLO WORLD")
      end

      it "handles empty transformations" do
        expect(StringWizard.transform("hello")).to eq("hello")
      end

      it "raises error for invalid transformations" do
        expect { StringWizard.transform("hello", :invalid) }.to raise_error(StringWizard::Error)
      end
    end
  end

  describe "Memoization" do
    describe ".clear_cache" do
      it "clears the memoization cache" do
        str = "test"
        StringWizard.character_frequency(str)
        expect(StringWizard.instance_variable_get(:@memo_cache)).not_to be_empty
        StringWizard.clear_cache
        expect(StringWizard.instance_variable_get(:@memo_cache)).to be_empty
      end
    end
  end
end 