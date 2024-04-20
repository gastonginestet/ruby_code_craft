# frozen_string_literal: true

require_relative "ruby_code_craft/version"

module RubyCodeCraft
  class Error < StandardError; end
  # Your code goes here...

  require 'fileutils'

  class RubyCodeGenerator
    # Initialize the RubyCodeGenerator with Ruby code string
    def initialize(code_string)
      @code_as_string = code_string
    end

    def execute_code
      ensure_directory_exists
      eval(@code_as_string)
    end

    def extract_filename_from_code
      # Extract the filename from the code using regex or any other method
      match = @code_as_string.match(/File\.open\(["'](.+?)["']/)
      match ? match[1] : 'script.rb' # Default filename if not found
    end

    def ensure_directory_exists
      filename = extract_filename_from_code
      directory = File.dirname(filename)
      FileUtils.mkdir_p(directory) unless Dir.exist?(directory)
    end
  end
end
