module RubyCodeCraft
  module Commands
    autoload :RubyCodeBot, 'ruby_code_craft/commands/ruby_code_bot'

    extend Dry::CLI::Registry

    register 'ruby_code_bot', aliases: ['rcg'] do |prefix|
      prefix.register 'chat', RubyCodeBot::Chat
    end
  end
end