module StringEnhancer
  module Transformer
    class Chain
      def initialize(str)
        @str = str
        @transformations = []
      end

      def titleize
        @transformations << :titleize
        self
      end

      def upcase
        @transformations << :upcase
        self
      end

      def downcase
        @transformations << :downcase
        self
      end

      def reverse
        @transformations << :reverse
        self
      end

      def strip
        @transformations << :strip
        self
      end

      def remove_vowels
        @transformations << :remove_vowels
        self
      end

      def remove_consonants
        @transformations << :remove_consonants
        self
      end

      def alternating_case
        @transformations << :alternating_case
        self
      end

      def reverse_words
        @transformations << :reverse_words
        self
      end

      def custom(&block)
        @transformations << block
        self
      end

      def apply
        result = @str.dup
        @transformations.each do |transformation|
          if transformation.is_a?(Proc)
            result = transformation.call(result)
          else
            result = StringEnhancer.transform(result, transformation)
          end
        end
        result
      end
    end

    def self.transform(str)
      Chain.new(str)
    end
  end
end 