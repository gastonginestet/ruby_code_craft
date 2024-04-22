# frozen_string_literal: true

require_relative "ruby_code_craft/version"

module RubyCodeCraft
  class Error < StandardError; end
  # Your code goes here...

  require 'fileutils'

  autoload :VERSION, 'ruby_code_craft/version'
  autoload :Commands, 'ruby_code_craft/commands'
  autoload :RubyCodeGenerator, 'ruby_code_craft/ruby_code_generator.rb'
end
