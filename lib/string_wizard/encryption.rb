module StringWizard
  module Encryption
    require 'openssl'
    require 'base64'

    class << self
      def encrypt(str, key, algorithm: 'AES-256-CBC')
        cipher = OpenSSL::Cipher.new(algorithm)
        cipher.encrypt
        cipher.key = Digest::SHA256.digest(key)
        iv = cipher.random_iv
        
        encrypted = cipher.update(str) + cipher.final
        Base64.strict_encode64(iv + encrypted)
      end

      def decrypt(encrypted_str, key, algorithm: 'AES-256-CBC')
        decoded = Base64.strict_decode64(encrypted_str)
        cipher = OpenSSL::Cipher.new(algorithm)
        cipher.decrypt
        cipher.key = Digest::SHA256.digest(key)
        
        iv = decoded[0...cipher.iv_len]
        encrypted = decoded[cipher.iv_len..-1]
        
        cipher.iv = iv
        cipher.update(encrypted) + cipher.final
      end

      def hash(str, algorithm: :sha256)
        case algorithm
        when :sha256
          Digest::SHA256.hexdigest(str)
        when :sha512
          Digest::SHA512.hexdigest(str)
        when :md5
          Digest::MD5.hexdigest(str)
        else
          raise Error, "Unsupported hash algorithm: #{algorithm}"
        end
      end

      def secure_compare(str1, str2)
        return false unless str1.bytesize == str2.bytesize
        
        result = 0
        str1.bytes.zip(str2.bytes) do |b1, b2|
          result |= b1 ^ b2
        end
        result.zero?
      end

      def generate_salt(length = 16)
        OpenSSL::Random.random_bytes(length)
      end

      def pbkdf2(str, salt, iterations: 10000, key_length: 32)
        OpenSSL::PKCS5.pbkdf2_hmac_sha1(
          str,
          salt,
          iterations,
          key_length
        )
      end
    end
  end
end 