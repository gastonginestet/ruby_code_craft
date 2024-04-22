module RubyCodeCraft
  module Commands
    module RubyCodeBot
      class Chat < Dry::CLI::Command
        desc 'Chat with the bot'

        # argument :name, required: true, desc: 'Name of the book'

        # example [
        #   '"My book" # Creates a new book named "My book"',
        #   'Memoires  # Creates a new book named "Memoires"'
        # ]

        def call()
          puts 'Ruby Code Bot', :green
          prompt = TTY::Prompt.new
          puts 'Hello!', :cyan
          message_to_bot = prompt.multiline('Message Ruby Code Bot:')
          bar = TTY::ProgressBar.new('processing [:bar]', total: 15)
          15.times do
            sleep(0.1)
            bar.advance(1)
          end
          puts 'Ready!', :green
          message_to_bot = message_to_bot.join
          puts "Your message:", :cyan
          puts message_to_bot
          puts "Bot's response:", :cyan
          puts "I'm a bot, I don't understand human language yet.", :yellow
          puts "But this is my default suggestion.", :yellow
          puts ""
          puts code_string, :yellow
          if (prompt.yes?('Do you want to generate the code?')) then
            bar = TTY::ProgressBar.new('generating [:bar]', total: 15)
            15.times do
              sleep(0.1)
              bar.advance(1)
            end
            RubyCodeGenerator.new(code_string).execute_code
            puts 'Ready!', :green
          else
            puts 'Bye!', :red
          end
        end

        private
        def code_string
          code_string = <<-RUBY
          # Open and write to a Ruby file for an RSpec model test
          File.open("spec/models/user_spec.rb", "w") do |file|
            file.write("# Tests for the User model\\n")
            file.write("require 'rails_helper'\\n\\n")
            file.write("RSpec.describe User, type: :model do\\n")
            file.write("  it 'validates the presence of required fields' do\\n")
            file.write("    should validate_presence_of(:first_name)\\n")
            file.write("    should validate_presence_of(:last_name)\\n")
            file.write("    should validate_presence_of(:email)\\n")
            file.write("    should validate_presence_of(:password_digest)\\n")
            file.write("  end\\n")
            file.write("end\\n")
          end
          RUBY
        end
      end
    end
  end
end
